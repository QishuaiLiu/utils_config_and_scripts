#!/usr/bin/env bash
#
# install_dracula_and_nerdfont.sh
#
# Quick setup for a freshly installed Ubuntu 22.04 / 24.04 system:
#   1. Install the "JetBrainsMono Nerd Font Mono" (patched Nerd Font).
#   2. Install and apply the Dracula theme for GNOME Terminal.
#
# Usage:
#   chmod +x install_dracula_and_nerdfont.sh
#   ./install_dracula_and_nerdfont.sh
#
# Notes:
#   - Run as a normal user (it uses sudo only where needed).
#   - Fonts are installed per-user under ~/.local/share/fonts.
#   - The Dracula theme is installed into the DEFAULT GNOME Terminal profile.

set -euo pipefail

# ----------------------------------------------------------------------------
# Config
# ----------------------------------------------------------------------------
NERD_FONT_NAME="JetBrainsMono"
NERD_FONT_VERSION="v3.4.0"   # https://github.com/ryanoasis/nerd-fonts/releases
FONT_DIR="${HOME}/.local/share/fonts"
FONT_FAMILY="JetBrainsMono Nerd Font Mono"
FONT_SIZE="12"

# ----------------------------------------------------------------------------
# Helpers
# ----------------------------------------------------------------------------
info()  { printf '\033[1;34m[INFO]\033[0m  %s\n' "$*"; }
ok()    { printf '\033[1;32m[ OK ]\033[0m  %s\n' "$*"; }
warn()  { printf '\033[1;33m[WARN]\033[0m  %s\n' "$*"; }
err()   { printf '\033[1;31m[FAIL]\033[0m  %s\n' "$*" >&2; }

# Ensure each required command is available, installing its apt package if not.
# Args are "cmd" or "cmd=pkg" when the binary name differs from the package
# (e.g. "dconf=dconf-cli", "fc-cache=fontconfig").
require_cmds() {
  local spec cmd pkg missing=()
  for spec in "$@"; do
    cmd="${spec%%=*}"
    pkg="${spec#*=}"        # equals cmd when no '=' present
    command -v "${cmd}" >/dev/null 2>&1 || missing+=("${pkg}")
  done
  if ((${#missing[@]})); then
    info "Installing missing dependencies: ${missing[*]}"
    sudo apt-get update -y
    sudo apt-get install -y "${missing[@]}"
  fi
}

# ----------------------------------------------------------------------------
# 0. Sanity check: Ubuntu version
# ----------------------------------------------------------------------------
if [[ -r /etc/os-release ]]; then
  # shellcheck disable=SC1091
  . /etc/os-release
  info "Detected: ${PRETTY_NAME:-unknown}"
  case "${VERSION_ID:-}" in
    22.04|24.04) ;;
    *) warn "This script targets Ubuntu 22.04/24.04; '${VERSION_ID:-?}' is untested but will be attempted." ;;
  esac
fi

# ----------------------------------------------------------------------------
# 1. Install JetBrainsMono Nerd Font
# ----------------------------------------------------------------------------
install_nerd_font() {
  info "Installing '${FONT_FAMILY}' (Nerd Font ${NERD_FONT_VERSION})..."

  if fc-list 2>/dev/null | grep -qi "JetBrainsMono Nerd Font Mono"; then
    ok "JetBrainsMono Nerd Font Mono already installed — skipping download."
    return 0
  fi

  require_cmds curl unzip fc-cache=fontconfig

  local tmp url zip
  tmp="$(mktemp -d)"
  url="https://github.com/ryanoasis/nerd-fonts/releases/download/${NERD_FONT_VERSION}/${NERD_FONT_NAME}.zip"
  zip="${tmp}/${NERD_FONT_NAME}.zip"

  info "Downloading ${url}"
  curl -fL --retry 3 -o "${zip}" "${url}"

  mkdir -p "${FONT_DIR}"
  info "Extracting fonts to ${FONT_DIR}"
  # Only extract the actual font files (skip README/LICENSE). A release may
  # ship .ttf only or .otf only, so a non-matching pattern makes unzip exit
  # with code 11 ("no matching files"); that is not fatal here — the fontconfig
  # check below is the real success gate.
  local rc=0
  unzip -o -j "${zip}" '*.ttf' '*.otf' -d "${FONT_DIR}" >/dev/null || rc=$?
  if (( rc != 0 && rc != 11 )); then
    err "unzip failed with exit code ${rc}."
    return 1
  fi
  rm -rf "${tmp}"

  info "Rebuilding font cache..."
  fc-cache -f "${FONT_DIR}" >/dev/null

  if fc-list | grep -qi "JetBrainsMono Nerd Font Mono"; then
    ok "Font installed: $(fc-list | grep -i 'JetBrainsMono Nerd Font Mono' | head -1 | cut -d: -f2 | xargs)"
  else
    err "Font files extracted but 'JetBrainsMono Nerd Font Mono' not detected by fontconfig."
    return 1
  fi
}

# ----------------------------------------------------------------------------
# 2. Install Dracula theme for GNOME Terminal
# ----------------------------------------------------------------------------
install_dracula_gnome_terminal() {
  info "Installing Dracula theme for GNOME Terminal..."

  if ! command -v gnome-terminal >/dev/null 2>&1; then
    warn "gnome-terminal not found — skipping Dracula terminal theme."
    warn "If you use another terminal (Kitty, Alacritty, Tilix...), grab the theme from https://draculatheme.com"
    return 0
  fi

  require_cmds git dconf=dconf-cli

  # Resolve the default profile UUID and make sure it has a visible name.
  # The upstream install.sh matches a profile by its NAME (get_uuid), so an
  # unnamed default profile (common on fresh installs) must be named first.
  local default_uuid profile_path profile_name
  default_uuid="$(gsettings get org.gnome.Terminal.ProfilesList default 2>/dev/null | tr -d \"\')" || true
  if [[ -z "${default_uuid}" ]]; then
    warn "Could not resolve the default GNOME Terminal profile — skipping Dracula theme."
    warn "Open GNOME Terminal once, then re-run this script."
    return 0
  fi
  profile_path="/org/gnome/terminal/legacy/profiles:/:${default_uuid}/"
  profile_name="$(dconf read "${profile_path}visible-name" 2>/dev/null | sed "s/^'//; s/'\$//")"
  if [[ -z "${profile_name}" ]]; then
    profile_name="Default"
    dconf write "${profile_path}visible-name" "'${profile_name}'"
    info "Named the default profile '${profile_name}'."
  fi

  local tmp
  tmp="$(mktemp -d)"
  info "Cloning dracula/gnome-terminal..."
  git clone --depth 1 https://github.com/dracula/gnome-terminal "${tmp}/dracula-gnome-terminal"

  # Passing both -s and -p makes install.sh fully non-interactive (no prompts).
  info "Applying the Dracula scheme to profile '${profile_name}'..."
  if ( cd "${tmp}/dracula-gnome-terminal" \
        && ./install.sh -s Dracula -p "${profile_name}" --skip-dircolors ); then
    ok "Dracula theme applied to the '${profile_name}' GNOME Terminal profile."
  else
    warn "install.sh failed; the theme was cloned but not applied."
    warn "Run it manually: cd '${tmp}/dracula-gnome-terminal' && ./install.sh"
    return 0
  fi

  rm -rf "${tmp}"
}

# ----------------------------------------------------------------------------
# 3. Set the Nerd Font as the GNOME Terminal font
# ----------------------------------------------------------------------------
set_terminal_font() {
  command -v gnome-terminal >/dev/null 2>&1 || return 0
  command -v gsettings   >/dev/null 2>&1 || return 0

  info "Setting GNOME Terminal font to '${FONT_FAMILY} ${FONT_SIZE}'..."

  # Resolve the default profile UUID.
  local default_profile profile_path
  default_profile="$(gsettings get org.gnome.Terminal.ProfilesList default 2>/dev/null | tr -d \"\')" || true
  if [[ -z "${default_profile}" ]]; then
    warn "Could not resolve default GNOME Terminal profile; set the font manually in Preferences."
    return 0
  fi
  profile_path="org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${default_profile}/"

  gsettings set "${profile_path}" use-system-font false
  gsettings set "${profile_path}" font "${FONT_FAMILY} ${FONT_SIZE}"

  ok "Terminal font set. Reopen GNOME Terminal to see the changes."
}

# ----------------------------------------------------------------------------
# Main
# ----------------------------------------------------------------------------
main() {
  install_nerd_font
  install_dracula_gnome_terminal
  set_terminal_font

  echo
  ok "All done!"
  echo "  • Font family to select in any terminal: '${FONT_FAMILY}'"
  echo "  • GNOME Terminal: Dracula colors + Nerd Font applied to the default profile."
  echo "  • Open a NEW terminal window to see the result."
}

main "$@"
