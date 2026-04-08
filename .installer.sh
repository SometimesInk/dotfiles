#!/usr/bin/env bash

# Start text.
echo "Warning: This installer assumes you are using Arch linux with a Wayland compositor."
echo "This installer will first ask for elevated permissions, it will then download"
echo "required package dependencies. The user will then be left with the job to clone"
echo "these dotfiles and stow them."
echo ""
echo "TLDR: This is an Arch installer for the dependencies of these dotfiles which"
echo "assume a Wayland compositor."
echo ""
echo "As an additional note, this is incomplete and untested."

# Elevate permissions.
su

# Checks whether a specific command ($1) exists on the system.
exist () {
  if type "$1" >/dev/null 2>&1; then
    return 0;
  else
    return 1;
  fi
}

exist "pacman"
if [[ $? -ne 0 ]]; then
  echo "Cannot find 'pacman' command."
  exit 1
fi

# Checks whether a specific pacman package ($1) is installed.
check () {
  if pacman -Qi "$1" &> /dev/null; then
    return 0;
  else
    return 1;
  fi
}


# Installs a specific package ($1) with pacman.
install () {
  check "$1"
  if [[ $? -ne 0 ]]; then
    pacman -S --noconfirm "$1"
  fi
}

exist "yay"
if [[ $? -ne 0 ]]; then
  echo "Cannot find 'yay' command."
  exit 1
fi

# Installs a specific package ($1) with yay.
yinstall () {
  check "$1"
  if [[ $? -ne 0 ]]; then
    yay -S --noconfirm "$1"
  fi
}

# Installation for nvim:
install "nvim"
install "git"
install "gcc"
install "npm"
install "nodejs"
install "tree-sitter"

install "convert"
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

# Installation for hyprland:
install "hyprland"
install "hyprpaper"

# Exit
install "stow"
echo "Clone dotfiles with 'git clone https://github.com/SometimesInk/dotfiles.git ~/.dotfiles'."
exit
echo "Successfully installed dependencies."
