# .dotfiles

Based on this setup https://www.atlassian.com/git/tutorials/dotfiles

## Install neovim from source (https://neovim.io/doc/build/)

- Install platform specific dependencies
`sudo apt-get install ninja-build gettext cmake curl build-essential git`

`git clone https://github.com/neovim/neovim`
`cd neovim`
`git checkout stable`
`sudo make install`
`cd build && cpack -G DEB && sudo dpkg -i nvim-linux-arm64.deb`
