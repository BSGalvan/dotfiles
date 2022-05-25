#!/usr/bin/env zsh
# Settings for junegunn/fzf

# Source fzf zsh completions, key-binds & customize
[ -f "/usr/share/fzf/key-bindings.zsh" ] &&
    source "/usr/share/fzf/key-bindings.zsh"

# Path for Gentoo: https://gitweb.gentoo.org/repo/gentoo.git/tree/app-shells/fzf/fzf-0.29.0.ebuild#n83-n89
[ -f "/usr/share/zsh/site-functions/_fzf" ] && export completion_file="/usr/share/zsh/site-functions/_fzf"

# Path for Arch: https://github.com/archlinux/svntogit-community/blob/packages/fzf/trunk/PKGBUILD#L67-L69
[ -f "/usr/share/fzf/completion.zsh" ] && export completion_file="/usr/share/fzf/completion.zsh"

source $completion_file

# Tweak some of the settings
export FZF_DEFAULT_OPTS="--reverse --border=rounded --margin=0,1,0 --info=inline"
export FZF_CTRL_T_OPTS="--preview 'bat --color=always --style=numbers --line-range=:500 {}' --preview-window right,60%,border-none"

unset completion_file
