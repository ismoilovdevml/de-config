#!/usr/bin/env bash
#
# XFCE4 macOS theme installer (Arch Linux / Manjaro)
#
# Usage: bash installer.sh
#
set -euo pipefail

# Resolve the script directory and the repository root
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd -- "${SCRIPT_DIR}/.." && pwd)"
WORK_DIR="${HOME}/Templates"

info()  { printf '\n\033[1;36m==> %s\033[0m\n' "$*"; }
warn()  { printf '\033[1;33m[!] %s\033[0m\n' "$*"; }
die()   { printf '\033[1;31m[x] %s\033[0m\n' "$*" >&2; exit 1; }

# --- Preflight checks ----------------------------------------------------

command -v pacman >/dev/null || die "This script targets Arch Linux / Manjaro only (pacman not found)."

AUR_HELPER=""
for h in yay paru pamac; do
  if command -v "$h" >/dev/null; then AUR_HELPER="$h"; break; fi
done
if [[ -z "$AUR_HELPER" ]]; then
  warn "No AUR helper (yay/paru/pamac) found. AUR packages will be skipped."
  warn "To install one: sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si"
fi

# Helper for installing AUR packages
aur_install() {
  [[ -z "$AUR_HELPER" ]] && { warn "No AUR helper, skipping: $*"; return 0; }
  case "$AUR_HELPER" in
    pamac) pamac build --no-confirm "$@" || warn "Failed to install from AUR: $*" ;;
    *)     "$AUR_HELPER" -S --needed --noconfirm "$@" || warn "Failed to install from AUR: $*" ;;
  esac
}

info "Checking sudo privileges"
sudo -v

# --- 1. Official repository packages ---------------------------------------------

info "Installing required packages"
sudo pacman -S --needed --noconfirm sassc git

info "Installing fonts"
# NOTE: 'adobe-source-sans-pro-fonts' was renamed to 'adobe-source-sans-fonts'.
# The old name makes pacman fail with "target not found".
sudo pacman -S --needed --noconfirm \
  noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra \
  ttf-dejavu ttf-roboto ttf-liberation ttf-fira-mono ttf-fira-sans \
  adobe-source-sans-fonts

info "Installing utilities"
# NOTE: neofetch was archived upstream in 2024 and dropped from the official
# Arch repositories; fastfetch is the maintained replacement.
sudo pacman -S --needed --noconfirm fastfetch lolcat figlet btop htop duf fish

# --- 2. AUR packages --------------------------------------------------------

# gtk-engine-murrine and ttf-joypixels moved out of the official repos into the AUR.
# gtk-engine-murrine is REQUIRED by the WhiteSur GTK theme.
info "Installing AUR packages (gtk-engine-murrine, ttf-joypixels)"
aur_install gtk-engine-murrine ttf-joypixels

# --- 3. Wallpapers ---------------------------------------------------------

# IMPORTANT: wallpapers/ lives at the repository ROOT, not inside xfce4-macos-config.
info "Copying wallpapers to ~/Pictures/wallpapers"
if [[ -d "${REPO_ROOT}/wallpapers" ]]; then
  mkdir -p "${HOME}/Pictures"
  cp -r "${REPO_ROOT}/wallpapers" "${HOME}/Pictures/"
else
  warn "wallpapers/ not found at ${REPO_ROOT}/wallpapers"
fi

# --- 4. WhiteSur theme, icons and cursors (from upstream) ------------------

mkdir -p "$WORK_DIR"

clone_or_pull() {
  local url="$1" dir="$2"
  if [[ -d "${WORK_DIR}/${dir}/.git" ]]; then
    info "${dir}: updating"
    git -C "${WORK_DIR}/${dir}" pull --ff-only || warn "${dir}: pull failed"
  else
    info "${dir}: cloning"
    git clone --depth 1 "$url" "${WORK_DIR}/${dir}"
  fi
}

clone_or_pull https://github.com/vinceliuice/WhiteSur-gtk-theme.git   WhiteSur-gtk-theme
clone_or_pull https://github.com/vinceliuice/WhiteSur-icon-theme.git  WhiteSur-icon-theme
clone_or_pull https://github.com/vinceliuice/WhiteSur-cursors.git     WhiteSur-cursors

info "Installing the WhiteSur GTK theme"
( cd "${WORK_DIR}/WhiteSur-gtk-theme" && ./install.sh )

info "Installing the WhiteSur icon theme"
( cd "${WORK_DIR}/WhiteSur-icon-theme" && ./install.sh )

info "Installing the WhiteSur cursors"
( cd "${WORK_DIR}/WhiteSur-cursors" && ./install.sh )

# --- 5. Bundled fonts ------------------------------------------

info "Copying bundled fonts to ~/.fonts"
if [[ -d "${SCRIPT_DIR}/.fonts" ]]; then
  mkdir -p "${HOME}/.fonts"
  cp -r "${SCRIPT_DIR}/.fonts/." "${HOME}/.fonts/"
  # Refresh the font cache; without this new fonts stay invisible to applications.
  fc-cache -f >/dev/null
else
  warn ".fonts directory not found"
fi

# --- 6. Desktop entries ---------------------------------------------------

info "Installing desktop entries for the Apple menu"
mkdir -p "${HOME}/.local/share/applications"
cp -r "${SCRIPT_DIR}/xpple_menu/applications/." "${HOME}/.local/share/applications/"

# --- 7. Menu definition ----------------------------------------------

# IMPORTANT: the freedesktop menu directory is ~/.config/menus (plural), NOT ~/.config/menu.
info "Installing xpple.menu into ~/.config/menus"
mkdir -p "${HOME}/.config/menus"
cp "${SCRIPT_DIR}/xpple_menu/xpple.menu" "${HOME}/.config/menus/"

# --- 8. Icons -----------------------------------------------------------

info "Installing Launchpad and related icons"
mkdir -p "${HOME}/.local/share/icons"
cp "${SCRIPT_DIR}/icons/"*.svg "${HOME}/.local/share/icons/"

# --- 9. WhiteSur tweaks -----------------------------------------------------

info "WhiteSur tweaks"
( cd "${WORK_DIR}/WhiteSur-gtk-theme" && ./tweaks.sh -f ) || \
  warn "tweaks.sh failed; upstream flags may have changed, check './tweaks.sh --help'."

# --- 10. Fish shell (optional) ---------------------------------------------

# NOTE: the previous version invoked 'fish' and 'sudo su' interactively here, which
# stalled the script and left every following line unexecuted. We now only set the
# login shell via chsh and apply the fish setting with a one-shot 'fish -c'.
info "Setting fish as the login shell"
if [[ "${SHELL:-}" != "/usr/bin/fish" ]]; then
  chsh -s /usr/bin/fish || warn "chsh failed; run it manually: chsh -s /usr/bin/fish"
fi
fish -c 'set -U fish_greeting ""' || warn "Could not set fish_greeting"

cat <<'EOF'

============================================================
  Installation complete.
============================================================

Next steps (see README.md for details):
  1. Select WhiteSur under Appearance -> Style / Icons / Fonts
  2. Configure the XFCE panel (Application Menu icon: start-here)
  3. Install the global menu:  bash global-menu.sh
  4. Follow the Plank and Ulauncher sections

The fish shell takes effect on your next login.
To use fish for root as well:  sudo chsh -s /usr/bin/fish root

EOF
