# Exporting Env variable
export EDITOR=nvim

export LOCAL_NODE="$HOME/.local/node"
export PYENV_ROOT="$HOME/.pyenv"
export GOPATH="$HOME/.local/go"
export GOBIN="$GOPATH/bin"

CARGO_BIN="$HOME/.cargo/bin"

export PATH="$HOME/.local/bin:$HOME/bin:$LOCAL_NODE/bin:$PYENV_ROOT/bin:$GOBIN:$CARGO_BIN:$PATH"

# Choose colorscheme from paleta or wal
(cat ~/.cache/current-palette) || (cat ~/.cache/wal/sequences) 2> /dev/null
