#!/bin/bash

# Installation function
omarchy_install() {
    if [[ ! -d "$HOME/.config/nvim" ]]; then
        omarchy-lazyvim-setup
    fi
}

# Verification function
omarchy_verify() {
    # Check if neovim config exists
    [[ -d "$HOME/.config/nvim" ]] || add_error "Neovim config directory missing"
}