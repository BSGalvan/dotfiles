#!/usr/bin/env zsh
# Settings for rupa/z

# Set up the folder for 'data' for z
export _Z_DATA="${XDG_DATA_HOME:-$HOME/.local/share}/z"

# Lower the score to age out entries faster (default=9000)
export _Z_MAX_SCORE=6000
