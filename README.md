# .dotfiles

Based on this setup https://www.atlassian.com/git/tutorials/dotfiles

## Installation

Make sure machine has github ssh key.

`curl -fsSL https://gist.githubusercontent.com/srmullen/ec0a339683fcd3a6973e3bb6fd542ff7/raw/dotfiles_setup.sh | bash`
`config submodule init && config submodule update`

### tmux plugins

Plugins are managed by tpm, not tracked in this repo. Bootstrap it once, then
install the plugins listed in `.tmux.conf` with `prefix + I` (prefix is `C-v`):

`git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`

This is just configuration. Still need to install nvim, tmux, etc.
