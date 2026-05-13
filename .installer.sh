#!/usr/bin/env bash
set -euo pipefail

sudo -v
# Keep sudo alive
while true; do
  sudo -n true
  sleep 60
  kill -0 "$$" || exit
done 2>/dev/null &
echo "Warning: This installer is designed for my own personal use."

NVIM=false
HYPRLAND=false
NIRI=false

# Parse flags
while [[ $# -gt 0 ]]; do
  case "$1" in
    # Example with value
    #-t=*|--target=*)
    #  TARGET=${1##*=}
    #  ;;
  -nvim|-neovim)
    NVIM=true
    ;;
  -hypr|-hyprland)
    HYPRLAND=true
    ;;
  -niri)
    NIRI=true
    ;;
  *)
    echo "Invalid flag $1"
    echo "Exiting."
    exit 1
    ;;
esac
shift
done

# Checks whether a specific command ($1) exists on the system.
exist () {
  command -v "$1" >/dev/null 2>&1
}

if ! exist "pacman"; then
  echo "Cannot find 'pacman' command."
  exit 1
fi

# Checks whether a specific pacman package ($1) is installed.
check () {
  pacman -Qi "$1" &> /dev/null
}

# Installs a specific package ($1) with pacman.
install () {
  if ! check "$1"; then
    sudo pacman -S --noconfirm "$1"
  fi
}

# Global dependencies
sudo pacman -Syu --noconfirm
sudo pacman -S --noconfirm --needed base-devel git

# Install yay if not found
if ! exist "yay"; then
  echo "Cannot find 'yay' command."
  echo "Install using:"
  echo "git clone https://aur.archlinux.org/yay.git"
  exit 1;
fi

# Installs a specific package ($1) with yay.
yinstall () {
  if ! check "$1"; then
    yay -S \
      --noconfirm \
      --answerclean All \
      --answerdiff None \
      --mflags "--noconfirm" \
      "$1"
  fi
}

COMMON_PACKAGES=(
  noto-fonts
  noto-fonts-cjk
  noto-fonts-emoji
  ttf-nerd-fonts-symbols
  ttf-nerd-fonts-symbols-common
  curl
  wget
  unzip
  zip
  p7zip
  tar
  gzip
  bzip2
  xz
  less
  man-db
  man-pages
  which
  file
  usbutils
  pciutils
  inetutils
  net-tools
  bind
  cmake
  openssh
  fzf
  bat
  zoxide
  networkmanager
  pipewire
  wireplumber
  pipewire-pulse
  pavucontrol
  bluez
  bluez-utils
  blueman
  fcitx5
  fcitx5-mozc
  fcitx5-configtool
  stow
  xdg-desktop-portal
  brightnessctl
  playerctl
  wl-clipboard
)

MISSING_PKGS=()

for pkg in "${COMMON_PACKAGES[@]}"; do
  if ! check "$pkg"; then
    MISSING_PKGS+=("$pkg")
  fi
done

if ((${#MISSING_PKGS[@]})); then
  sudo pacman -S --noconfirm "${MISSING_PKGS[@]}"
fi

sudo systemctl enable --now NetworkManager

sudo systemctl enable --now bluetooth

# Installation for nvim
if [[ "$NVIM" == true ]]; then
  install "neovim"
  install "nodejs"
  install "tree-sitter-cli"
  install "tree-sitter"

  install "imagemagick"
  install "ghostscript"
  install "texlive-core"
  install "mermaid-cli"
  install "lazygit"
  install "ripgrep"
  install "fd"

  install "bash-language-server"
  install "clang"
  install "vscode-html-languageserver"
  install "vscode-json-languageserver"
  yinstall "jdtls"
  install "lua-language-server"
  install "pyright"
  install "taplo-cli"
  install "typescript-language-server"
fi

if [[ "$NVIM" == false ]]; then
  install "vim"
fi

# Installation for hyprland
if [[ "$HYPRLAND" == true ]]; then
  install "hyprland"
  install "xdg-desktop-portal-hyprland"
fi

# Installation for niri
if [[ "$NIRI" == true ]]; then
  install "niri"
fi

# Exit
echo "Clone dotfiles with 'git clone https://github.com/SometimesInk/dotfiles.git ~/.dotfiles'."
echo "Successfully installed dependencies."
