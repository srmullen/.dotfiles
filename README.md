# .dotfiles

Based on this setup https://www.atlassian.com/git/tutorials/dotfiles

## Install neovim from source (https://neovim.io/doc/build/)

- Install platform specific dependencies
`sudo apt-get install ninja-build gettext cmake curl build-essential git`

`git clone https://github.com/neovim/neovim`
`cd neovim`
`git checkout stable`
`sudo make install`

*tmux*

tmux should already be installed. To add plugins/theming install tpm

`git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`

press the default key binding prefix + I to fetch- and install the plugin
