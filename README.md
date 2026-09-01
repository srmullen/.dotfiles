# .dotfiles

Shell, editor, terminal and tmux configuration, tracked as a bare git repo
checked out over `$HOME` — the setup described in
[this Atlassian tutorial](https://www.atlassian.com/git/tutorials/dotfiles).
There is no symlink farm and no dotfile manager: `$HOME` *is* the working tree,
and a `config` alias stands in for `git`.

## What's in here

| Path | What it configures |
| --- | --- |
| `.zshrc` | zsh: starship prompt, PATH for volta/bun/pnpm/go, nvm, conda, gcloud |
| `.bashrc` | bash fallback, mostly stock Debian |
| `.gitconfig` | git defaults; identity lives in an untracked `~/.gitconfig.local` |
| `.tmux.conf` | tmux: `C-v` prefix, vim-style pane nav, tpm plugin list |
| `.config/nvim` | submodule → [srmullen/kickstart.nvim](https://github.com/srmullen/kickstart.nvim) |
| `.config/starship.toml` | starship prompt |
| `.config/ghostty/config` | Ghostty terminal |
| `install.sh` | bootstrap script (see below) |

## Prerequisites

This repo is *only* configuration — it installs none of the tools it configures.
Install what you need first:

`git` `zsh` `neovim` `tmux` `starship` `ghostty` `volta` (plus `nvm`, `pnpm`,
`bun`, `conda`/`mambaforge`, `gcloud` if you want those lines in `.zshrc` to do
anything — they're all guarded by existence checks, so missing ones are inert).

## Installation

```sh
curl -fsSL https://raw.githubusercontent.com/srmullen/.dotfiles/main/install.sh | bash
```

The script clones this repo bare to `~/.cfg.git` and checks it out over `$HOME`.
Anything it would overwrite is moved to `~/.config-backup` first. Read it before
you run it — it writes directly into your home directory.

Then the two steps it can't do for you:

```sh
config submodule init && config submodule update          # neovim config
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Start tmux and press `prefix + I` to install the tmux plugins. **The prefix is
remapped to `C-v`, not the default `C-b`.**

Forking? Set `DOTFILES_REPO` to your own remote before running the script.

## Day-to-day use

`config` is a git alias pointing at this repo, defined in `.zshrc` and `.bashrc`:

```sh
config status
config add .zshrc
config commit -m "..."
config push
```

Untracked files are hidden (`status.showUntrackedFiles no`), otherwise `config
status` would list your entire home directory.

## Git identity

`.gitconfig` is tracked, so it deliberately contains **no** `[user]` section —
otherwise anyone installing these dotfiles would start authoring commits as me.
It instead includes `~/.gitconfig.local`, which is gitignored. Create it per
machine:

```ini
[user]
	name = Your Name
	email = you@example.com
```

Note that `git config --global user.email` will print nothing, because
`--includes` defaults to off when a specific config file is named. Plain
`git config user.email` resolves it normally, and commits are authored correctly.

## Branches

`main` is macOS. `ubuntu` and `raspberrypi` carry per-machine deltas for those
hosts and are merged from `main` as it moves. **You are on `ubuntu`.**

## Ubuntu specifics

`.config/nvim` on this branch points at its own commit of kickstart.nvim, not
the one `main` uses. Keep it that way when merging.

**neovim** needs a C compiler, and the apt package is usually too old:

```sh
sudo apt update && sudo apt install build-essential
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim-linux-x86_64
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
```

`.bashrc` adds `/opt/nvim-linux-x86_64/bin` to `PATH` for that install.

**tmux** is normally already present; only tpm needs fetching (see the install
steps above). `.tmux.conf` sets `default-terminal`/`terminal-overrides` here so
truecolor works, which the macOS branch doesn't need.

## License

MIT — see [LICENSE](LICENSE).
