SPACESHIP_CHAR_SYMBOL=' '
SPACESHIP_CHAR_SUFFIX=' '

SPACESHIP_JOBS_SYMBOL='鈴'
SPACESHIP_JOBS_AMOUNT_THRESHOLD=0 # Show job amount when it's > 0

SPACESHIP_EXIT_CODE_SHOW=true
SPACESHIP_EXIT_CODE_SYMBOL='✘ '

SPACESHIP_GIT_STATUS_PREFIX=" [ "

# Left prompt sections
SPACESHIP_PROMPT_ORDER=(
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git_stat      # Git statistic
  git           # Git section (git_branch + git_status)
  hg            # Mercurial section (hg_branch  + hg_status)
  package       # Package version
  node          # Node.js section
  ruby          # Ruby section
  elixir        # Elixir section
  xcode         # Xcode section
  swift         # Swift section
  golang        # Go section
  php           # PHP section
  rust          # Rust section
  haskell       # Haskell Stack section
  julia         # Julia section
  docker        # Docker section
  toolbox       # Fedora toolbox
  aws           # Amazon Web Services section
  gcloud        # Google Cloud Platform section
  venv          # virtualenv section
  conda         # conda virtualenv section
  pyenv         # Pyenv section
  dotnet        # .NET section
  ember         # Ember.js section
  kubectl       # Kubectl context section
  terraform     # Terraform workspace section
  exec_time     # Execution time
  line_sep      # Line break
  vi_mode       # Vi-mode indicator
  char          # Prompt character
)

# Right prompt sections
SPACESHIP_RPROMPT_ORDER=(
  jobs          # Background jobs indicator
  exit_code     # Exit code section
)

# Source custom section
CUSTOM_SECTION_DIR="$HOME/.zshrc.d/spaceship.d"
for section in $(spaceship::union $SPACESHIP_PROMPT_ORDER $SPACESHIP_RPROMPT_ORDER); do
  if [[ -f "$CUSTOM_SECTION_DIR/$section.zsh" ]]; then
    source "$CUSTOM_SECTION_DIR/$section.zsh"
  elif spaceship::defined "spaceship_$section"; then
    # section is declared
    continue
  else
    echo "Section '$section' was not loaded"
  fi
done
