# Exporting Env variable

export EDITOR=$(which nvim)

export LOCAL_NODE="$HOME/.local/node"
export PYENV_ROOT="$HOME/.pyenv"
export GOPATH="$HOME/.local/go"
export GOBIN="$GOPATH/bin"

NIMBLE="$HOME/.nimble/bin"
CARGO_BIN="$HOME/.cargo/bin"

export PATH="$HOME/.local/bin:$HOME/bin:$LOCAL_NODE/bin:$PYENV_ROOT/bin:$GOBIN:$CARGO_BIN:$NIMBLE:$PATH"
eval $(luarocks path --bin)
if [ -e /var/home/ekickx/.nix-profile/etc/profile.d/nix.sh ]; then . /var/home/ekickx/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
