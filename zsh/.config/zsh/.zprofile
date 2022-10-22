# Adds directories in `~/.local/bin/` to $PATH
export PATH="$PATH:${$(find ~/.local/bin -type d -printf %p:)%%:}"

# Default programs
export VISUAL="nvim"
export EDITOR="nvim"
export TERMINAl="st"
export BROWSER="firefox-bin"

# Cleaning up ~
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

export _JAVA_AWT_WM_NONREPARENTING=1   # Fix for Java applications in dwm
export CARGO_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/cargo"
export CONDARC="${XDG_CONFIG_HOME:-$HOME/.config}/conda/condarc"
export GNUPGHOME="${XDG_DATA_HOME:-$HOME/.local/share}/gnupg"
export GTK2_RC_FILES="${XDG_CONFIG_HOME:-$HOME/.config}/gtk-2.0/gtkrc"
export GTK_RC_FILES="${XDG_CONFIG_HOME:-$HOME/.config}/gtk-1.0/gtkrc"
export HISTFILE="${XDG_STATE_HOME:-$HOME/.local/state}/zsh/history"
export INPUTRC="${XDG_CONFIG_HOME:-$HOME/.config}/readline/inputrc"
export IPYTHONDIR="${XDG_CONFIG_HOME:-$HOME/.config}/ipython"
export JULIA_DEPOT_PATH="${XDG_DATA_HOME:-$HOME/.local/share}/julia:$JULIA_DEPOT_PATH"
export JUPYTER_CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/jupyter"
export LESSHISTFILE="-"
export OCTAVE_HISTFILE="${XDG_CACHE_HOME:-$HOME/.cache}/octave-hsts"
export OCTAVE_SITE_INITFILE="${XDG_CONFIG_HOME:-$HOME/.config}/octave/octaverc"
export RUSTUP_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/rustup"
export TEXMFCONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/texlive/texmf-config"
export TEXMFHOME="${XDG_DATA_HOME:-$HOME/.local/share}/texmf"
export TEXMFVAR="${XDG_CACHE_HOME:-$HOME/cache}/texlive/texmf-var"
export VERSION_CONTROL='none'  # Tell GNU indent to not make any backups
export VIMINIT='let $MYVIMRC = !has("nvim") ? "$XDG_CONFIG_HOME/vim/vimrc" : "$XDG_CONFIG_HOME/nvim/init.lua" | so $MYVIMRC'
export XAUTHORITY=$XDG_RUNTIME_DIR/Xauthority
export XBINDKEYSRC="${XDG_CONFIG_HOME:-$HOME/.config}"/xbindkeys/config
export XINITRC="${XDG_CONFIG_HOME:-$HOME/.config}"/x11/xinitrc
export XRESOURCES="${XDG_CONFIG_HOME:-$HOME/.config}"/x11/xresources
export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}"/zsh

# Rustup Shell Setup
# affix colons on either side of $PATH to simplify matching
case ":${PATH}:" in
    *:"${CARGO_HOME:-$HOME/.local/share/cargo}/bin":*)
        ;;
    *)
        # prepending path in case a system-installed rustc needs to be overridden
        export PATH="${CARGO_HOME:-$HOME/.local/share/cargo}/bin:$PATH"
        ;;
esac
