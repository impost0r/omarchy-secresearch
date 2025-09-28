#!/bin/bash

# Installation function
omarchy_install() {
    # Install all base packages
    mapfile -t packages < <(grep -v '^#' "$OMARCHY_INSTALL/omarchy-base.packages" | grep -v '^$')
    sudo pacman -S --noconfirm --needed "${packages[@]}"
}

# Verification function
omarchy_verify() {
    # Check if package list exists
    [[ -f "$OMARCHY_INSTALL/omarchy-base.packages" ]] || add_error "Base packages list missing"

    # Check if some key base packages are installed
    command -v bash >/dev/null 2>&1 || add_error "Bash not installed"
    command -v sudo >/dev/null 2>&1 || add_error "Sudo not installed"
}