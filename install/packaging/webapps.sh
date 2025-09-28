#!/bin/bash

# Installation function
omarchy_install() {
    omarchy-webapp-install "HEY" https://app.hey.com HEY.png
    omarchy-webapp-install "Basecamp" https://launchpad.37signals.com Basecamp.png
    omarchy-webapp-install "WhatsApp" https://web.whatsapp.com/ WhatsApp.png
    omarchy-webapp-install "Google Photos" https://photos.google.com/ "Google Photos.png"
    omarchy-webapp-install "Google Contacts" https://contacts.google.com/ "Google Contacts.png"
    omarchy-webapp-install "Google Messages" https://messages.google.com/web/conversations "Google Messages.png"
    omarchy-webapp-install "ChatGPT" https://chatgpt.com/ ChatGPT.png
    omarchy-webapp-install "YouTube" https://youtube.com/ YouTube.png
    omarchy-webapp-install "GitHub" https://github.com/ GitHub.png
    omarchy-webapp-install "X" https://x.com/ X.png
    omarchy-webapp-install "Figma" https://figma.com/ Figma.png
    omarchy-webapp-install "Discord" https://discord.com/channels/@me Discord.png
    omarchy-webapp-install "Zoom" https://app.zoom.us/wc/home Zoom.png "omarchy-webapp-handler-zoom %u" "x-scheme-handler/zoommtg;x-scheme-handler/zoomus"
}

# Verification function
omarchy_verify() {
    # Check if some key webapp desktop files were created
    [[ -f "$HOME/.local/share/applications/HEY.desktop" ]] || add_error "HEY webapp not installed"
    [[ -f "$HOME/.local/share/applications/WhatsApp.desktop" ]] || add_error "WhatsApp webapp not installed"
    [[ -f "$HOME/.local/share/applications/ChatGPT.desktop" ]] || add_error "ChatGPT webapp not installed"
}