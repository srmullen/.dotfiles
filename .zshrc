eval "$(starship init zsh)"
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

export PATH="/Users/seanmullen/go/bin:$PATH"

export TERM=xterm-256color

# pnpm
export PNPM_HOME="/Users/seanmullen/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/seanmullen/mambaforge/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/seanmullen/mambaforge/etc/profile.d/conda.sh" ]; then
        . "/Users/seanmullen/mambaforge/etc/profile.d/conda.sh"
    else
        export PATH="/Users/seanmullen/mambaforge/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "/Users/seanmullen/mambaforge/etc/profile.d/mamba.sh" ]; then
    . "/Users/seanmullen/mambaforge/etc/profile.d/mamba.sh"
fi
# <<< conda initialize <<<


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/seanmullen/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/seanmullen/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/seanmullen/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/seanmullen/google-cloud-sdk/completion.zsh.inc'; fi

alias config="$(which git) --git-dir=$HOME/.cfg.git/ --work-tree=$HOME"
