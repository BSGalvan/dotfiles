# ---------------------------------------------------------------------------------------
# Lines configured by zsh-newuser-install

[[ ! -d ${XDG_STATE_HOME:-$HOME/.local/state}/zsh ]] && 
    mkdir -p ${XDG_STATE_HOME:-$HOME/.local/state}/zsh

HISTFILE="${XDG_STATE_HOME:-$HOME/.local/state}/zsh/history"
HISTSIZE=10000
SAVEHIST=1000000

setopt autocd extendedglob nomatch notify
unsetopt beep
bindkey -v

# End of lines configured by zsh-newuser-install
# ---------------------------------------------------------------------------------------

# ---------------------------------------------------------------------------------------
# Declaring stuff for rossmacarthur/sheldon
# Note: this section should come before compinit, so that completions are properly
#       initialized.
# TODO: bootstrap sheldon's installation, along with LS_COLORS install!
# Step 1.) Download the prebuilt binary for the host architecture

export SHELDON_INSTALL_DIR="$HOME/.local/bin"
curl --proto '=https' -fLsS https://rossmacarthur.github.io/install/crate.sh \
    | bash -s -- --repo rossmacarthur/sheldon --to "$SHELDON_INSTALL_DIR"

# Step 2.) Now that you have the binary, remember to get the plugins.toml file from
#          BSGalvan/dotfiles! Then the next two lines will setup all the required plugins
export SHELDON_DATA_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/sheldon"
eval "$(sheldon source)"

# Step 3.) Download trapd00r/LS_COLORS. This creates a lscolors.(c)sh in
#          $XDG_DATA_HOME
mkdir /tmp/LS_COLORS && 
    curl -L https://api.github.com/repos/trapd00r/LS_COLORS/tarball/master |
    tar xzf - --directory=/tmp/LS_COLORS --strip=1

( cd /tmp/LS_COLORS && sh install.sh 2>/dev/null 1>&2 )

# Step 4.) Enable LS_COLORS!
source "${XDG_DATA_HOME:-$HOME/.local/share}/lscolors.sh"

# ---------------------------------------------------------------------------------------

# ---------------------------------------------------------------------------------------
# The following lines were added by compinstall

zstyle ':completion:*' auto-description '%d'
zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' expand prefix
zstyle ':completion:*' file-sort name
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' list-suffixes true
zstyle ':completion:*' matcher-list 'r:|[._-]=* r:|=*' \
                                    'l:|=* r:|=*' \
                                    'm:{[:lower:]}={[:upper:]}' \
                                    '+m:{[:lower:][:upper:]}={[:upper:][:lower:]}'
zstyle ':completion:*' max-errors 2
zstyle ':completion:*' menu select=3
zstyle ':completion:*' prompt 'Did you mean:'
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*' use-cache on
# I added these two lines... Do they have a +/- effect?
zstyle ':completion:*' cache-path $XDG_CACHE_HOME/zsh/zcompcache
zstyle :compinstall filename '/home/bsg/.config/zsh/.zshrc'

autoload -Uz compinit && compinit -d $XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION

# End of lines added by compinstall
# ---------------------------------------------------------------------------------------

# ---------------------------------------------------------------------------------------
# Generally making life easier

# Required for menuselect

zmodload -i zsh/complist

## Use vim keys in TAB-complete menu

bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -v '^H' backward-kill-word

## Use up/down arrows to match partial commands

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down


## Change cursor shape for different vi modes.

function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[5 q';;      # block
        viins|main) echo -ne '\e[1 q';; # beam
    esac
}
zle -N zle-keymap-select

zle-line-init() {
    echo -ne "\e[1 q"
}
zle -N zle-line-init

_fix_cursor() {
   echo -ne '\e[1 q'
}

## Change the prompt style

export PROMPT="%(?..%F{1}💀%?%f)%F{2}%3~%f %F{200}%#%f "
export RPROMPT='$GITSTATUS_PROMPT'

## A function for easily sampling zsh startup times

timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do time $shell -i -c exit; done
}

# End of Easy Life configuration
# ---------------------------------------------------------------------------------------

# ---------------------------------------------------------------------------------------
# Compartmentalized Personalization
# All the plugin-specific settings, aliases and clean-home exports I'll ever need

sources=(
    'aliases'
    'fontpreview-ueberzug'
    'fzf'
    'timer'
    'z'
)

for s in "${sources[@]}"; do
  source ${XDG_CONFIG_HOME:-$HOME/.config}/zsh/include/${s}.zsh
done

# Colorize man pages using bat
export MANPAGER="sh -c 'col -bx | bat -l man -p'"


# End of Compartmentalized Personalization
# ---------------------------------------------------------------------------------------

# Conda Initialization
# ---------------------------------------------------------------------------------------
# !! Contents within this block are managed by 'conda init' !!

__conda_setup="$('/home/bsg/.local/share/mambaforge/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/bsg/.local/share/mambaforge/etc/profile.d/conda.sh" ]; then
        . "/home/bsg/.local/share/mambaforge/etc/profile.d/conda.sh"
    else
    export PATH="$PATH:/home/bsg/.local/share/mambaforge/bin"
      fi
fi
unset __conda_setup

# End of Conda Initialization
# ---------------------------------------------------------------------------------------
