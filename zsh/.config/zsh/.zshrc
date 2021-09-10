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
# Declaring stuff for zinit
# Note: this section should come before compinit, so that completions are properly
#       initialized.

declare -A ZINIT

export ZINIT[HOME_DIR]="${XDG_DATA_HOME:-$HOME/.local/share}/zinit"
export ZINIT[BIN_DIR]="${ZINIT[HOME_DIR]}/bin"
export ZINIT[PLUGINS_DIR]="${ZINIT[HOME_DIR]}/plugins"
export ZINIT[COMPLETIONS_DIR]="${ZINIT[HOME_DIR]}/completions"
export ZINIT[SNIPPETS_DIR]="${ZINIT[HOME_DIR]}/snippets"
export ZINIT[ZCOMPDUMP_PATH]="$XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION"

# Bootstrapping the installation of zinit, so that I don't have to install it by hand
# Step 1.) Create the top-level directory if it doesn't exist

[[ ! -d ${ZINIT[HOME_DIR]} ]] &&
    mkdir -p ${ZINIT[HOME_DIR]}

# Step 2.) Clone the repo if it doesn't exist

[[ ! -d ${ZINIT[BIN_DIR]} ]] &&
    git clone https://github.com/zdharma/zinit.git ${ZINIT[BIN_DIR]}

# Step 3.) Finish by sourcing. All the plugins will be installed as well.
source "${ZINIT[BIN_DIR]}/zinit.zsh"

# Note: These lines set up completion for `zinit`, and are needed only if
#       you source the zinit.zsh file after compinit
#  autoload -Uz _zinit
#  (( ${+_comps} )) && _comps[zinit]=_zinit

# Note: lucid     => don't present 'Loaded <plugin>' prompt
#       wait'!n'  => defer plugin loading till n ms (>~ 1ms) after loading zshrc
#                    and ! reloads the prompt
zinit wait'!1' lucid light-mode for \
    esc/conda-zsh-completion \
    OMZ::plugins/timer/timer.plugin.zsh \
    pick"z.sh" \
        rupa/z

zinit lucid light-mode for \
    zdharma/fast-syntax-highlighting \
    depth"1" pick"gitstatus.prompt.zsh" \
        romkatv/gitstatus

zinit ice atclone"dircolors -b LS_COLORS > clrs.zsh" \
    atpull'%atclone' pick"clrs.zsh" nocompile'!' \
    atload'zstyle ":completion:*" list-colors “${(s.:.)LS_COLORS}”'
zinit light trapd00r/LS_COLORS

# End of zinit declarations
# ---------------------------------------------------------------------------------------

# ---------------------------------------------------------------------------------------
# The following lines were added by compinstall

zstyle ':completion:*' auto-description '%d'
zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' expand prefix
zstyle ':completion:*' file-sort name
zstyle ':completion:*' insert-unambiguous true
#  zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
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
