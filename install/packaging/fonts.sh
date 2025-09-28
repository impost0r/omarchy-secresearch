#!/bin/bash

# Installation function
omarchy_install() {
    # Omarchy logo in a font for Waybar use
    mkdir -p ~/.local/share/fonts
    cp ~/.local/share/omarchy/config/omarchy.ttf ~/.local/share/fonts/
    fc-cache
}

# Verification function
omarchy_verify() {
    # Check if fonts directory exists
    [[ -d ~/.local/share/fonts ]] || add_error "Fonts directory missing"

    # Check if Omarchy font is installed
    [[ -f ~/.local/share/fonts/omarchy.ttf ]] || add_error "Omarchy font missing"
}