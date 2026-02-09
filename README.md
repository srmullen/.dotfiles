# .dotfiles

Based on this setup https://www.atlassian.com/git/tutorials/dotfiles

## Installation

*dotfiles*

Make sure machine has github ssh key.

`curl -fsSL https://gist.githubusercontent.com/srmullen/ec0a339683fcd3a6973e3bb6fd542ff7/raw/88068e218da4150cfc02a4e0e4b263a1bc6ba291/dotfiles_setup.sh | bash`
`config submodule init && config submodule update`

This is just configuration. Still need to install nvim, tmux, etc.

*nvim*

Need to have a C compiler.

`sudo apt update && sudo apt install build-essential`

```
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim-linux-x86_64
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz

mkdir -p $HOME/.local/bin
mv nvim-linux-x86_64.appimage $HOME/.local/bin
```

*tmux*

tmux should already be installed. To add plugins/theming install tpm

`git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`

press the default key binding prefix + I to fetch- and install the plugin

