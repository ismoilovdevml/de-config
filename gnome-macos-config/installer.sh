#!/usr/bin/env bash
#
# GNOME macOS theme installer (Ubuntu / Debian based distributions)
#
# Usage: bash installer.sh
#
set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
WORK_DIR="${HOME}/Templates"

info() { printf '\n\033[1;36m==> %s\033[0m\n' "$*"; }
warn() { printf '\033[1;33m[!] %s\033[0m\n' "$*"; }
die()  { printf '\033[1;31m[x] %s\033[0m\n' "$*" >&2; exit 1; }

command -v apt-get >/dev/null || die "This script targets Ubuntu/Debian (apt-get not found).
For Arch Linux / Manjaro use ../xfce4-macos-config instead."

info "Checking sudo privileges"
sudo -v

# --- 1. Packages -------------------------------------------------------------

info "Refreshing package lists"
sudo apt-get update

info "Installing required packages"
sudo apt-get install -y git gnome-tweaks plank gnome-shell-extension-manager

# NOTE: 'chrome-gnome-shell' was renamed to 'gnome-browser-connector'; on Ubuntu
# 23.04+ the old name is only a transitional package. Try the new name first and
# fall back to the old one.
info "Installing the browser connector"
sudo apt-get install -y gnome-browser-connector \
  || sudo apt-get install -y chrome-gnome-shell \
  || warn "Browser connector not installed; use extensions.gnome.org manually."

# --- 2. Ulauncher ------------------------------------------------------------

info "Installing Ulauncher"
if ! command -v ulauncher >/dev/null; then
  sudo add-apt-repository -y ppa:agornostal/ulauncher \
    && sudo apt-get update \
    && sudo apt-get install -y ulauncher \
    || warn "Ulauncher could not be installed from the PPA; install it manually from https://ulauncher.io/"
else
  info "Ulauncher is already installed"
fi

# --- 3. WhiteSur theme and icons ----------------------------------------

# Preferred path: fetch from upstream so the theme is always current. The copy
# bundled in this repository is an old snapshot and contains case-colliding
# symlinks that do not survive checkout on macOS/Windows.
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

if clone_or_pull https://github.com/vinceliuice/WhiteSur-gtk-theme.git WhiteSur-gtk-theme; then
  info "Installing the WhiteSur GTK theme"
  ( cd "${WORK_DIR}/WhiteSur-gtk-theme" && ./install.sh )
else
  warn "Upstream fetch failed; falling back to the bundled copy"
  if [[ -d "${SCRIPT_DIR}/.themes" ]]; then
    mkdir -p "${HOME}/.themes"
    cp -r "${SCRIPT_DIR}/.themes/." "${HOME}/.themes/"
  fi
fi

if clone_or_pull https://github.com/vinceliuice/WhiteSur-icon-theme.git WhiteSur-icon-theme; then
  info "Installing the WhiteSur icon theme"
  ( cd "${WORK_DIR}/WhiteSur-icon-theme" && ./install.sh )
else
  warn "Upstream fetch failed; falling back to the bundled copy"
  if [[ -d "${SCRIPT_DIR}/.icons" ]]; then
    mkdir -p "${HOME}/.icons"
    cp -r "${SCRIPT_DIR}/.icons/." "${HOME}/.icons/"
  fi
fi

# --- 4. Plank themes -----------------------------------------------------

info "Installing Plank themes"
if [[ -d "${SCRIPT_DIR}/plank" ]]; then
  mkdir -p "${HOME}/.local/share/plank/themes"
  cp -r "${SCRIPT_DIR}/plank/." "${HOME}/.local/share/plank/themes/"
else
  warn "plank/ directory not found"
fi

# --- 5. Wallpapers --------------------------------------------------------

REPO_ROOT="$(cd -- "${SCRIPT_DIR}/.." && pwd)"
info "Copying wallpapers to ~/Pictures/wallpapers"
if [[ -d "${REPO_ROOT}/wallpapers" ]]; then
  mkdir -p "${HOME}/Pictures"
  cp -r "${REPO_ROOT}/wallpapers" "${HOME}/Pictures/"
else
  warn "wallpapers/ directory not found"
fi

cat <<'EOF'

============================================================
  Installation complete.
============================================================

Next steps:
  1. Open GNOME Tweaks and select the WhiteSur theme under
     Appearance -> Shell / Legacy Applications
  2. For icons: Tweaks -> Appearance -> Icons -> WhiteSur
  3. Configure Dash to Dock or Plank
  4. Install the GNOME extensions you want via Extension Manager

EOF
