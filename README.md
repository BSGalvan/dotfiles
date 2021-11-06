# Dotfiles 🐧

Mostly a note to self, in case I hit my head someday.

## Installation & Usage

This dotfiles repo is managed using [GNU stow](https://www.gnu.org/software/stow/).
In order to get started with using my configs for the software listed below, you can simply:
  * Clone this repo *into your home directory*
  * From within the cloned repo, run:
    + `stow calcurse` for setting up the symlinks for calcurse. Replace as necessary.
    + `stow *` for setting up all the symlinks.
  * Profit!

## List of Stuff

I use the following pieces of software. Might be useful to you too:

* Major:
  + [dunst](https://github.com/dunst-project/dunst)
  + [dynamic menu](https://tools.suckless.org/dmenu/)
  + [dynamic window manager](https://dwm.suckless.org/)
  + [feh](https://github.com/derf/feh), for setting the wallpaper
  + [neovim](https://github.com/neovim/neovim)
  + [suckless image viewer](https://github.com/muennich/sxiv)
  + [suckless status](https://tools.suckless.org/slstatus/)
  + [suckless terminal](https://st.suckless.org/)
  + [tmux](https://github.com/tmux/tmux)
  + [zathura](https://pwmt.org/projects/zathura/), for all-things PDF and more!
  + [zsh](https://www.zsh.org/)

* Minor:
  + [bat](https://github.com/sharkdp/bat)
  + [exa](https://github.com/ogham/exa)
  + [fontpreview-ueberzug](https://github.com/OliverLew/fontpreview-ueberzug)
  + [fzf](https://github.com/junegunn/fzf)
  + [sheldon](https://github.com/rossmacarthur/sheldon) for managing zsh plugins
    - [fast-syntax-highlighting](https://github.com/zdharma-continuum/fast-syntax-highlighting)
    - [gitstatus](https://github.com/romkatv/gitstatus)
    - [LS_COLORS](https://github.com/trapd00r/LS_COLORS), although this is setup a _little_ differently. See the note below.
    - [timer](https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/timer/timer.plugin.zsh)
    - [z](https://github.com/rupa/z)

Note for LS_COLORS: Since this plugin doesn't play well with
rossmacarthur/sheldon, it is sourced according to the instructions on
the repo. However, since this plugin is updated semi-frequently, updates
aren't _really_ necessary (although you could setup a `cron` job to `git
pull` and check anyways)

## Eye-candy

The following is purely eye candy.

* [picom (yshui's fork)](https://github.com/yshui/picom), for window fading, blur & transparency.
* Fonts:
    + [Julia Mono](https://github.com/cormullion/juliamono), used majorly for code.
    + [FiraCode Nerd Font](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/FiraCode), for the status bar.
    + [FiraMono Nerd Font](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/FiraMono), alternative monospace font.
    + [JoyPixels](https://www.joypixels.com/emoji), for those sweet, sweet emojis.
* [Wallpapers](https://gitlab.com/BSGalvan/walls)
