
### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk

### The actual config here

## Speed test
zinit light paulmelnikow/zsh-startup-timer

## Load prompt theme
zinit light denysdovhan/spaceship-prompt

## Load my lib from gitlab
# Keybinding
zinit ice id-as="keybinding.zsh"
zinit snippet https://gitlab.com/ekickx/my-zsh-lib/-/raw/master/key-binding.zsh
# Aliases
zinit ice id-as="aliases"
zinit snippet https://gitlab.com/ekickx/my-zsh-lib/-/raw/master/aliases

## Nice libs from oh-my-zsh
# Load this lib immediatly because it can't work if wait
zinit for \
    OMZ::lib/history.zsh 
# Load these libs only after prompt is loaded
zinit wait lucid for \
    OMZ::lib/completion.zsh \
    OMZ::lib/termsupport.zsh

# Load these plugins 1 second after prompt loaded
zinit wait="1" lucid light-mode for \
    zsh-users/zsh-autosuggestions \
    zdharma/history-search-multi-word \
    wfxr/forgit \
    zdharma/fast-syntax-highlighting 

## Get cool cli programs
# Get prebuilt binaries from github release
zinit wait lucid from="github-rel" as="program" for \
    sbin"fzf"          junegunn/fzf \
    sbin"**/rg"        BurntSushi/ripgrep \
    sbin"**/delta"     dandavison/delta \
    sbin"**/bat"       @sharkdp/bat \
    sbin"**/fd"        @sharkdp/fd \
    sbin"exa* -> exa"  ogham/exa \
    sbin"rip* -> rip"  nivekuil/rip 
# Cli program that doesn't have github release
# or need to be manually compiled
zinit wait lucid from="github" as="program" for \
  sbin"lsix"          hackerb9/lsix \
  sbin"paleta"  make  dylanaraps/paleta \
  sbin"pfetch"  make  dylanaraps/pfetch \
  sbin"nnn"     make="O_NERD=1"  jarun/nnn
