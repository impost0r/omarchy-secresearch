#!/bin/bash

# Installation function
omarchy_install() {
    # Copy all bundled icons to the applications/icons directory
    ICON_DIR="$HOME/.local/share/applications/icons"
    mkdir -p "$ICON_DIR"
    cp ~/.local/share/omarchy/applications/icons/*.png "$ICON_DIR/"
}

# Verification function
omarchy_verify() {
    # Check if icons directory exists
    [[ -d "$HOME/.local/share/applications/icons" ]] || add_error "Icons directory missing"

    # Check if any icons were copied
    local icon_count=$(find "$HOME/.local/share/applications/icons" -name "*.png" 2>/dev/null | wc -l)
    [[ $icon_count -gt 0 ]] || add_error "No icons found in icons directory"
}