#!/bin/zsh
GHOSTTY_CONFIG_DIR="$HOME/.config/ghostty"
CURRENT_DIR="${0:a:h}"

mkdir -p "$GHOSTTY_CONFIG_DIR"
ln -sf "$CURRENT_DIR/config.ini" "$GHOSTTY_CONFIG_DIR/config"
