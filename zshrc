
### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit compinit && compinit 
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk

### User config here ###

## Choose colorscheme from paleta or wal
((cat ~/.cache/current-palette) || (cat ~/.cache/wal/sequences)) 2>/dev/null

## Speed test plugin
zinit light paulmelnikow/zsh-startup-timer

## Load prompt theme
zinit light denysdovhan/spaceship-prompt

## Load my aliases and other zsh lib ##
# Spaceship(prompt theme) config
zinit ice id-as="zshrc.d/spaceship-config.zsh"
zinit snippet ~/.zshrc.d/spaceship-config.zsh
# Keybinding
zinit ice id-as="zshrc.d/keybinding.zsh"
zinit snippet ~/.zshrc.d/keybinding.zsh
# Aliases
zinit ice wait lucid id-as="zshrc.d/aliases"
zinit snippet ~/.zshrc.d/aliases
# Useful function
zinit ice wait lucid id-as="zshrc.d/function.zsh"
zinit snippet ~/.zshrc.d/function.zsh
# Z.lua config
zinit ice wait lucid id-as="zshrc.d/z-lua-config.zsh"
zinit snippet ~/.zshrc.d/z-lua-config.zsh
# Config for plugin that has few config option
zinit ice wait="2" lucid id-as="zshrc.d/plugins-config.zsh"
zinit snippet ~/.zshrc.d/plugins-config.zsh

## Nice libs from oh-my-zsh ##
# Load this lib immediatly because it can't work if wait
zinit snippet OMZ::lib/history.zsh 
# Load these libs only after prompt is loaded
zinit wait lucid for \
    OMZ::lib/completion.zsh \
    OMZ::lib/termsupport.zsh \
    OMZ::plugins/command-not-found
# Load these plugins 1 second after prompt loaded
zinit wait="1" lucid light-mode for \
    Aloxaf/fzf-tab \
    zsh-users/zsh-autosuggestions \
    zdharma/history-search-multi-word \
    skywind3000/z.lua \
    wfxr/forgit \
    romkatv/zsh-prompt-benchmark \
    MichaelAquilina/zsh-you-should-use \
    hlissner/zsh-autopair \
    zdharma/fast-syntax-highlighting

## Get cool cli programs ##
# Get prebuilt binaries from github release
zinit wait lucid from="github-rel" as="program" for \
    sbin"fzf"          junegunn/fzf \
    sbin"**/rg"        BurntSushi/ripgrep \
    sbin"**/delta"     dandavison/delta \
    sbin"**/bat"       @sharkdp/bat \
    sbin"**/fd"        @sharkdp/fd \
    sbin"bin/* -> exa" ogham/exa \
    sbin"nix* -> nix-user-chroot" nix-community/nix-user-chroot
# Cli program that doesn't have github release
# or need to be compiled manually 
zinit wait lucid from="github" as="program" for \
  sbin"lsix"          hackerb9/lsix \
  sbin"paleta"  make  dylanaraps/paleta \
  sbin"pfetch"  make  dylanaraps/pfetch \
  sbin"nnn"     make="O_NERD=1"  jarun/nnn
