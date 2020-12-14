## Table of Content
- [My Workflow Demo](#my-workflow-demo)
- [How to Use](#how-to-use)
- [Zshenv](#zshenv)
- [Zshrc](#zshrc)
  * [Plugin](#plugin)
  * [CLI Program](#cli-program) 

# My Workflow Demo 

# How to Use
Just create symlink to its respective dir. Or just use the `deploy.sh`

```
example

git clone https://github.com/ekickx/term-n-shell
cd term-n-shell
ln -s -f ${PWD}/zshrc ${HOME}/.zshrc

or

git clone https://github.com/ekickx/term-n-shell
cd term-n-shell
./deploy.sh
```

# Zshenv
My `.zshenv` and `.bash_profile` are symlink of `.profile`. After setting environment variable, on the last line, I put command that will set my terminal colorscheme with [ANSI escape code](https://en.wikipedia.org/wiki/ANSI_escape_code#Colors). You can generate it with [paleta](https://github.com/dylanaraps/paleta)

# Zshrc
I use [`zinit`](https://github.com/zdharma/zinit) for managing my `.zshrc`. It's blazing fast. Usually I get startup time around 130-290 ms. This is the time I got when writing this README

```
➜ zinit times
Plugin loading times:
    4 ms - zinit-zsh/z-a-rust
    2 ms - zinit-zsh/z-a-as-monitor
    3 ms - zinit-zsh/z-a-patch-dl
    6 ms - zinit-zsh/z-a-bin-gem-node
    7 ms - paulmelnikow/zsh-startup-timer
   21 ms - denysdovhan/spaceship-prompt
    2 ms - my-zsh-lib/aliases
    3 ms - my-zsh-lib/keybinding.zsh
    2 ms - OMZ::lib/history.zsh
    2 ms - OMZ::lib/completion.zsh
    2 ms - OMZ::lib/termsupport.zsh
    2 ms - junegunn/fzf (command)
    2 ms - ClementTsang/bottom (command)
    2 ms - BurntSushi/ripgrep (command)
    2 ms - dandavison/delta (command)
    2 ms - sharkdp/bat (command)
    2 ms - sharkdp/fd (command)
    2 ms - ogham/exa (command)
    2 ms - nivekuil/rip (command)
    2 ms - hackerb9/lsix (command)
    2 ms - dylanaraps/paleta (command)
    2 ms - dylanaraps/pfetch (command)
    2 ms - jarun/nnn (command)
    8 ms - zsh-users/zsh-autosuggestions
    3 ms - zdharma/history-search-multi-word
   11 ms - wfxr/forgit
   31 ms - zdharma/fast-syntax-highlighting
Total: 0.131 sec
```

## Plugin
These are the zsh plugins that I use

- [zsh-startup-timer](https://github.com/paulmelnikow/zsh-startup-timer)
- [spaceship-prompt](https://github.com/denysdovhan/spaceship-prompt) - Nice zsh prompt theme
- [zsh-autosuggestion](https://github.com/zsh-users/zsh-autosuggestions) - Fish-like autosuggestions for zsh
- [history-search-multi-word](https://github.com/zdharma/history-search-multi-word) - Multi-word history searching for Zsh
- [forgit](https://github.com/wfxr/forgit) - A utility tool powered by fzf for using git interactively
- [fast-syntax-highlighting](https://github.com/zdharma/fast-syntax-highlighting)

## CLI Program
One of the reason I like `zinit` is the possibility to manage binaries. So If a package hasn't available in my distro's repo, I just grab the prebuilt binary or compile it with `zinit`.

This is the CLI program list that I use with `zinit`.

- [fzf](https://github.com/junegunn/fzf) - A command-line fuzzy finder 
- [ripgrep](https://github.com/BurntSushi/ripgrep) - `grep` but respect your gitignore
- [delta](https://github.com/dandavison/delta) - A viewer for git and diff output 
- [bat](https://github.com/sharkdp/bat) - `cat` but prettier
- [fd](https://github.com/sharkdp/fd) - `find` but faster and more user friendly
- [exa](https://github.com/ogham/exa) - `ls` but better
- [rip](https://github.com/nivekuil/rip) - Send your file to graveyard
- [nnn](https://github.com/jarun/nnn) - n³ The unorthodox terminal file manager
- [lsix](https://github.com/hackerb9/lsix) - `ls` but for image using sixel
- [pfetch](https://github.com/dylanaraps/pfetch) - A pretty system information tool
- [paleta](https://github.com/dylanaraps/paleta) - Generate ANSI escape code for colorscheme
 
