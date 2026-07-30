#!/usr/bin/env bash
#
# Installer for Vala Panel AppMenu (macOS-style global menu)
# Arch Linux / Manjaro + XFCE4
#
# Usage: bash global-menu.sh
#
set -euo pipefail

info() { printf '\n\033[1;36m==> %s\033[0m\n' "$*"; }
warn() { printf '\033[1;33m[!] %s\033[0m\n' "$*"; }
die()  { printf '\033[1;31m[x] %s\033[0m\n' "$*" >&2; exit 1; }

command -v pacman >/dev/null || die "This script targets Arch Linux / Manjaro only (pacman not found)."

# Detect an available AUR helper
AUR_HELPER=""
for h in yay paru pamac; do
  if command -v "$h" >/dev/null; then AUR_HELPER="$h"; break; fi
done
[[ -z "$AUR_HELPER" ]] && die "No AUR helper (yay/paru/pamac) found. Install one first:
  sudo pacman -S --needed git base-devel
  git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si"

info "Checking sudo privileges"
sudo -v

# The GTK module comes from the official repository
info "Installing appmenu-gtk-module (official repo)"
sudo pacman -S --needed --noconfirm appmenu-gtk-module

# The Vala Panel AppMenu packages live in the AUR.
# NOTE: the previous version also listed 'build' here. No such package exists in
# either the official repos or the AUR, so the whole command aborted with
# "could not find all required packages".
info "Installing vala-panel-appmenu packages (AUR)"
AUR_PKGS=(
  vala-panel-appmenu-common-git
  vala-panel-appmenu-registrar-git
  vala-panel-appmenu-xfce-git
)
case "$AUR_HELPER" in
  pamac) pamac build --no-confirm "${AUR_PKGS[@]}" ;;
  *)     "$AUR_HELPER" -S --needed --noconfirm "${AUR_PKGS[@]}" ;;
esac

# Route GTK application menus to the panel
info "Applying xsettings"
if command -v xfconf-query >/dev/null; then
  xfconf-query -c xsettings -p /Gtk/ShellShowsMenubar -n -t bool -s true
  xfconf-query -c xsettings -p /Gtk/ShellShowsAppmenu  -n -t bool -s true
else
  warn "xfconf-query not found; re-run this from inside an XFCE session."
fi

cat <<'EOF'

============================================================
  Global menu installed.
============================================================

Next steps:
  1. Log out and back in (or reboot)
  2. Right-click the XFCE panel -> Panel -> Add New Items...
  3. Add "Global Menu" (Appmenu) from the list

EOF
