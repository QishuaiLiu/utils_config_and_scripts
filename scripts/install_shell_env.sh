#!/usr/bin/env bash
#
# install_shell_env.sh
#
# Quick shell environment setup for a freshly installed Ubuntu 22.04 / 24.04:
#   1. zsh
#   2. oh-my-zsh (unattended)
#   3. zsh-autosuggestions plugin (enabled in ~/.zshrc)
#   4. tmux
#   5. tpm - tmux plugin manager (with a minimal ~/.tmux.conf)
#   6. fzf - fuzzy finder with zsh key bindings + completion
#   7. Set zsh as the default login shell.
#
# Usage:
#   chmod +x install_shell_env.sh
#   ./install_shell_env.sh
#
# Notes:
#   - Run as a normal user (uses sudo only where needed).
#   - Idempotent: safe to re-run; existing installs are detected and skipped.
#   - After running, log out/in (or `exec zsh`) to enter zsh, then press
#     prefix + I inside tmux to fetch the tmux plugins.

set -euo pipefail

# ----------------------------------------------------------------------------
# Config
# ----------------------------------------------------------------------------
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_CONFIG_DIR="$(cd "${SCRIPT_DIR}/../config" 2>/dev/null && pwd || true)"

ZSH_DIR="${HOME}/.oh-my-zsh"
ZSH_CUSTOM="${ZSH_CUSTOM:-${ZSH_DIR}/custom}"
ZSHRC="${HOME}/.zshrc"
TPM_DIR="${HOME}/.tmux/plugins/tpm"
FZF_DIR="${HOME}/.fzf"
FZF_ZSH="${HOME}/.fzf.zsh"
TMUX_CONF="${HOME}/.tmux.conf"
TMUX_CONF_SRC="${REPO_CONFIG_DIR:+${REPO_CONFIG_DIR}/.tmux.conf}"

# ----------------------------------------------------------------------------
# Helpers
# ----------------------------------------------------------------------------
info()  { printf '\033[1;34m[INFO]\033[0m  %s\n' "$*"; }
ok()    { printf '\033[1;32m[ OK ]\033[0m  %s\n' "$*"; }
warn()  { printf '\033[1;33m[WARN]\033[0m  %s\n' "$*"; }
err()   { printf '\033[1;31m[FAIL]\033[0m  %s\n' "$*" >&2; }

# Ensure each required command is available, installing its apt package if not.
# Args are "cmd" or "cmd=pkg" when the binary name differs from the package.
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
# 1. zsh + core tools
# ----------------------------------------------------------------------------
install_zsh() {
  info "Installing zsh, tmux, git, curl..."
  require_cmds zsh tmux git curl
  ok "zsh $(zsh --version | awk '{print $2}') and tmux $(tmux -V | awk '{print $2}') available."
}

# ----------------------------------------------------------------------------
# 2. oh-my-zsh
# ----------------------------------------------------------------------------
install_oh_my_zsh() {
  # Detect a *complete* install by its core script, not just the directory —
  # the directory can be created as a side effect of cloning custom plugins.
  if [[ -f "${ZSH_DIR}/oh-my-zsh.sh" ]]; then
    ok "oh-my-zsh already installed at ${ZSH_DIR} — skipping."
    return 0
  fi

  # Install via git clone (the official manual method). This avoids the
  # rate-limit-prone raw.githubusercontent.com installer and fails loudly if
  # the network is unavailable, instead of silently "succeeding".
  info "Installing oh-my-zsh (git clone)..."
  if [[ -e "${ZSH_DIR}" ]]; then
    warn "${ZSH_DIR} exists but is incomplete — removing it before reinstall."
    rm -rf "${ZSH_DIR}"
  fi
  git clone --depth 1 https://github.com/ohmyzsh/ohmyzsh.git "${ZSH_DIR}"

  if [[ ! -f "${ZSH_DIR}/oh-my-zsh.sh" ]]; then
    err "oh-my-zsh clone did not produce ${ZSH_DIR}/oh-my-zsh.sh."
    return 1
  fi

  # Seed ~/.zshrc from the template on a fresh system; keep an existing one.
  if [[ -f "${ZSHRC}" ]]; then
    info "Keeping existing ${ZSHRC}."
  else
    cp "${ZSH_DIR}/templates/zshrc.zsh-template" "${ZSHRC}"
    ok "Created ${ZSHRC} from the oh-my-zsh template."
  fi

  ok "oh-my-zsh installed."
}

# ----------------------------------------------------------------------------
# 3. zsh-autosuggestions
# ----------------------------------------------------------------------------
install_autosuggestions() {
  local dest="${ZSH_CUSTOM}/plugins/zsh-autosuggestions"
  if [[ -d "${dest}" ]]; then
    ok "zsh-autosuggestions already present — skipping clone."
  else
    info "Cloning zsh-autosuggestions..."
    git clone --depth 1 https://github.com/zsh-users/zsh-autosuggestions "${dest}"
  fi

  # Enable the plugin in ~/.zshrc's plugins=(...) array.
  [[ -f "${ZSHRC}" ]] || { warn "No ${ZSHRC} found; cannot enable plugin automatically."; return 0; }

  if grep -q 'zsh-autosuggestions' "${ZSHRC}"; then
    ok "zsh-autosuggestions already enabled in ${ZSHRC}."
  elif grep -qE '^plugins=\(' "${ZSHRC}"; then
    # Append to the existing single-line plugins=(...) array.
    sed -i 's/^plugins=(\(.*\))/plugins=(\1 zsh-autosuggestions)/' "${ZSHRC}"
    ok "Added zsh-autosuggestions to the plugins list."
  else
    # No plugins line at all — add one.
    printf '\nplugins=(git zsh-autosuggestions)\n' >> "${ZSHRC}"
    ok "Added a plugins=(git zsh-autosuggestions) line to ${ZSHRC}."
  fi
}

# ----------------------------------------------------------------------------
# 4. tpm (tmux plugin manager) + minimal ~/.tmux.conf
# ----------------------------------------------------------------------------
install_tpm() {
  if [[ -d "${TPM_DIR}" ]]; then
    ok "tpm already present at ${TPM_DIR} — skipping clone."
  else
    info "Cloning tpm (tmux plugin manager)..."
    git clone --depth 1 https://github.com/tmux-plugins/tpm "${TPM_DIR}"
  fi

  # Install this repo's ready-made ~/.tmux.conf (it already declares the tpm
  # plugins and the bootstrap `run` line).
  if [[ -z "${TMUX_CONF_SRC}" || ! -f "${TMUX_CONF_SRC}" ]]; then
    err "Repo tmux config not found at '${TMUX_CONF_SRC:-<config dir missing>}'."
    err "Run this script from within the cloned repo (scripts/ next to config/)."
    return 1
  fi

  if [[ -f "${TMUX_CONF}" ]] && cmp -s "${TMUX_CONF_SRC}" "${TMUX_CONF}"; then
    ok "${TMUX_CONF} already matches the repo config — nothing to do."
    return 0
  fi

  if [[ -f "${TMUX_CONF}" ]]; then
    cp "${TMUX_CONF}" "${TMUX_CONF}.bak"
    warn "Existing ${TMUX_CONF} backed up to ${TMUX_CONF}.bak"
  fi
  cp "${TMUX_CONF_SRC}" "${TMUX_CONF}"
  ok "Installed ${TMUX_CONF} from ${TMUX_CONF_SRC}."
}

# ----------------------------------------------------------------------------
# 6. fzf (fuzzy finder) + zsh key bindings & completion
# ----------------------------------------------------------------------------
install_fzf() {
  # Install from the official git repo rather than apt: this pulls a current
  # release on any Ubuntu version and ships the `install` script that generates
  # the shell-integration file (~/.fzf.zsh).
  if [[ -d "${FZF_DIR}/.git" ]]; then
    ok "fzf already present at ${FZF_DIR} — skipping clone."
  else
    info "Cloning fzf..."
    git clone --depth 1 https://github.com/junegunn/fzf.git "${FZF_DIR}"
  fi

  # Build the binary and generate ~/.fzf.zsh (key bindings + completion).
  # --no-update-rc: we wire ~/.zshrc ourselves below, idempotently.
  info "Running fzf installer (key bindings + completion)..."
  "${FZF_DIR}/install" --key-bindings --completion --no-update-rc --no-bash --no-fish

  # Source the integration file from ~/.zshrc, matching the autosuggestions step.
  [[ -f "${ZSHRC}" ]] || { warn "No ${ZSHRC} found; cannot enable fzf automatically."; return 0; }

  if grep -q '\.fzf\.zsh' "${ZSHRC}"; then
    ok "fzf already sourced in ${ZSHRC}."
  else
    printf '\n[ -f %s ] && source %s\n' "${FZF_ZSH}" "${FZF_ZSH}" >> "${ZSHRC}"
    ok "Added fzf source line to ${ZSHRC}."
  fi
}

# ----------------------------------------------------------------------------
# 7. Make zsh the default shell
# ----------------------------------------------------------------------------
set_default_shell() {
  local zsh_path
  zsh_path="$(command -v zsh)"
  if [[ "${SHELL:-}" == "${zsh_path}" ]]; then
    ok "zsh is already the default shell."
    return 0
  fi

  info "Setting zsh as the default login shell..."
  if sudo chsh -s "${zsh_path}" "$(id -un)"; then
    ok "Default shell changed to zsh (takes effect on next login)."
  else
    warn "Could not change the default shell automatically."
    warn "Run manually: chsh -s ${zsh_path}"
  fi
}

# ----------------------------------------------------------------------------
# Main
# ----------------------------------------------------------------------------
main() {
  install_zsh
  install_oh_my_zsh
  install_autosuggestions
  install_tpm
  install_fzf
  set_default_shell

  echo
  ok "All done!"
  echo "  • Start zsh now with:   exec zsh   (or log out and back in)"
  echo "  • Inside tmux, press:   <prefix> + I   to install the tmux plugins"
  echo "    (default prefix is Ctrl-b, so Ctrl-b then Shift-i)"
  echo "  • fzf: Ctrl-R (history), Ctrl-T (files), Alt-C (cd) in zsh"
}

main "$@"
