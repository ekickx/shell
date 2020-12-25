## Table of Content
- [How to Use](#how-to-use)
- [Zshenv](#zshenv)
- [Zshrc](#zshrc)
  * [Plugin](#plugin)
  * [Zshrc.d](#zshrc.d)
  * [CLI Program](#cli-program) 

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
My `.zshenv` and `.bash_profile` are symlink of `.profile`. 

# Zshrc
I use [`zinit`](https://github.com/zdharma/zinit) for managing my `.zshrc`. It's blazing fast. Usually I get startup time around 130-290 ms. 

<details>
  <summary>This is the time I got when writing this README</summary>

```
➜ zinit times
Plugin loading times:
    3 ms - zinit-zsh/z-a-rust
    2 ms - zinit-zsh/z-a-as-monitor
    3 ms - zinit-zsh/z-a-patch-dl
    5 ms - zinit-zsh/z-a-bin-gem-node
    8 ms - paulmelnikow/zsh-startup-timer
   26 ms - denysdovhan/spaceship-prompt
    1 ms - zshrc.d/spaceship-config.zsh
    2 ms - zshrc.d/keybinding.zsh
    1 ms - OMZ::lib/history.zsh
    2 ms - zshrc.d/aliases
    2 ms - zshrc.d/function.zsh
    2 ms - OMZ::lib/completion.zsh
    2 ms - OMZ::lib/termsupport.zsh
    2 ms - OMZ::plugins/command-not-found
    1 ms - junegunn/fzf (command)
    1 ms - ClementTsang/bottom (command)
    1 ms - BurntSushi/ripgrep (command)
    1 ms - dandavison/delta (command)
    1 ms - sharkdp/bat (command)
    1 ms - sharkdp/fd (command)
    1 ms - ogham/exa (command)
    1 ms - nivekuil/rip (command)
    1 ms - hackerb9/lsix (command)
    1 ms - dylanaraps/paleta (command)
    1 ms - dylanaraps/pfetch (command)
    1 ms - jarun/nnn (command)
    3 ms - zsh-users/zsh-autosuggestions
    3 ms - zdharma/history-search-multi-word
   12 ms - wfxr/forgit
    2 ms - romkatv/zsh-prompt-benchmark
   28 ms - zdharma/fast-syntax-highlighting
    2 ms - zshrc.d/plugins-config
Total: 0.123 sec
```
</details>

## Plugin
These are the zsh plugins that I use:

- [zsh-startup-timer](https://github.com/paulmelnikow/zsh-startup-timer)
- [spaceship-prompt](https://github.com/denysdovhan/spaceship-prompt) - Nice zsh prompt theme
- [zsh-autosuggestion](https://github.com/zsh-users/zsh-autosuggestions) - Fish-like autosuggestions for zsh
- [history-search-multi-word](https://github.com/zdharma/history-search-multi-word) - Multi-word history searching for Zsh
- [forgit](https://github.com/wfxr/forgit) - A utility tool powered by fzf for using git interactively
- [fast-syntax-highlighting](https://github.com/zdharma/fast-syntax-highlighting)

## Zshrc.d
I use directory `zshrc.d` to place my other zsh configuration, such as aliases, keybinding, and plugin's config.

- [Spaceship's config](zshrc.d/spaceship-config.zsh)

  I change some icons and make `git_status` to show file's amount that modified, deleted, stagged, etc.

- [Keybinding](zshrc.d/keybinding.zsh)

  You can see all the keybinding that I use with `bindkey -M main`

- [Aliases](zshrc.d/aliases)

- [Function](zshrc.d/function.zsh) - Useful functions

- [Plugins config](zshrc.d/plugins-config.zsh) - Config for plugin that has few config option

  I plan to dump all plugins's config that has few config option in this file. For now I only use it for [`fast-syntax-highlighting`](https://github.com/zdharma/fast-syntax-highlighting) to display bracket highlighting.

## CLI Program
One of the reason I like `zinit` is the possibility to manage binaries. So If a package hasn't available in my distro's repo, I just grab the prebuilt binary or compile it with `zinit`.

This is the CLI program list that I use with `zinit`:

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
 
