#!/usr/bin/env zsh
# All the aliases I'll ever need!

# startx and xbindkeys need to be pointed towards 
# their respective rc files

[ -f "$XINITRC" ] && 
    alias startx="startx $XINITRC"
[ -f "$XBINDKEYSRC" ] &&
    alias xbindkeys="xbindkeys -f $XBINDKEYSRC"

# Extremely useful shortcuts for configuring 
# suckless stuff

alias \
    swpcon="mv config.def.h config.def.h.bak && mv config.h config.def.h" \
    uswpcon="mv config.def.h config.h && mv config.def.h.bak config.def.h"

# Shortcuts for configuration files

alias \
    cdmn="${EDITOR:-vim} $XDG_CONFIG_HOME/dmenu/config.h" \
    cdwm="${EDITOR:-vim} $XDG_CONFIG_HOME/dwm/config.h" \
    csls="${EDITOR:-vim} $XDG_CONFIG_HOME/slstatus/config.h" \
    cst="${EDITOR:-vim} $XDG_CONFIG_HOME/st/config.h" \
    cvrc="${EDITOR:-vim} $XDG_CONFIG_HOME/vim/vimrc" \
    cnvc="${EDITOR:-vim} $XDG_CONFIG_HOME/nvim/init.lua" \
    czal="${EDITOR:-vim} $XDG_CONFIG_HOME/zsh/include/aliases.zsh" \
    czat="${EDITOR:-vim} $XDG_CONFIG_HOME/zathura/zathurarc" \
    czsh="${EDITOR:-vim} $XDG_CONFIG_HOME/zsh/.zshrc" \
    cssh="${EDITOR:-vim} $HOME/.ssh/config"

# Shortcuts for the ls family
alias \
    l="ls -lFh" \
    la="exa -alF" \
    li="exa --tree --icons" \
    ll="ls -l" \
    lr="ls -tRFh" \
    ls="ls --color=auto" \
    lt="ls -ltFh"

# Shortcuts for generally long commands
# Also include more verbose, friendly versions of mv and rm
alias \
    bc="bc -ql" \
    cat="bat" \
    md="mkdir" \
    mv="mv -v" \
    rm="rm -i" \
    xbk="xbindkeys -f $XBINDKEYSRC --poll-rc" \
    def="dict -d gcide"

# Shortcuts for the git family
alias \
    gita="git add" \
    gitc="git commit" \
    gitd="git diff" \
    gitl='git log --graph --full-history --all --pretty=format:"%h%x09%d%x20%s"' \
    gitp="git pull" \
    gitP="git push" \
    gitr="git restore" \
    gits="git status"

# Shortcuts for transmission-cli
alias \
    tma="transmission-remote -a" \
    tmd="transmission-daemon" \
    tml="transmission-remote -l" \

# Shortcuts for the ytdl family
alias \
    ytdla="yt-dlp -x --audio-format vorbis -o '%(title)s.%(ext)s'" \
    ytdlp="yt-dlp -x --audio-format vorbis -o '%(playlist_index)02d %(title)s.%(ext)s'"

# Shortcuts for the buku family
alias \
    b="buku --suggest"

# Shortcuts for work
alias \
    heainit=". $HEADAS/headas-init.sh"
