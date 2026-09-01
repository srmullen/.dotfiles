#!/usr/bin/env bash
#
# Clones this repo as a bare repo at ~/.cfg.git and checks it out over $HOME,
# backing up any dotfiles that would be overwritten to ~/.config-backup.
#
#   curl -fsSL https://raw.githubusercontent.com/srmullen/.dotfiles/main/install.sh | bash
#
# Forks: set DOTFILES_REPO to your own remote before running.

REPO="${DOTFILES_REPO:-https://github.com/srmullen/.dotfiles.git}"
GIT_DIR="$HOME/.cfg.git"

cd "$HOME" || exit 1

if [ -e "$GIT_DIR" ]; then
  echo "$GIT_DIR already exists; nothing to do." >&2
  exit 1
fi

git clone --bare "$REPO" "$GIT_DIR" || exit 1

config() {
  git --git-dir="$GIT_DIR/" --work-tree="$HOME" "$@"
}

if config checkout 2>/dev/null; then
  echo "Checked out config."
else
  echo "Backing up pre-existing dotfiles to ~/.config-backup"
  config checkout 2>&1 | grep -E "^\s+\." | awk '{print $1}' | while read -r f; do
    mkdir -p "$HOME/.config-backup/$(dirname "$f")"
    mv "$HOME/$f" "$HOME/.config-backup/$f"
  done
  config checkout || exit 1
fi

config config status.showUntrackedFiles no

cat <<'EOF'

Done. Two manual steps remain:

  config submodule init && config submodule update
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

Then start tmux and press `prefix + I` (prefix is C-v) to install plugins.
EOF
