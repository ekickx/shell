SPACESHIP_CHAR_SYMBOL=' '
SPACESHIP_CHAR_SUFFIX=' '

SPACESHIP_JOBS_SYMBOL='鈴'
SPACESHIP_JOBS_AMOUNT_THRESHOLD=0 # Show job amount when it's > 0

SPACESHIP_EXIT_CODE_SHOW=true
SPACESHIP_EXIT_CODE_SYMBOL='✘ '

SPACESHIP_GIT_STATUS_PREFIX=" [ "

# Give amount to git_status with git_stat_num #

spaceship_git_stat_num(){
local INDEX {UNTRACKED,ADDED,MODIFIED,RENAMED,DELETED,UNMERGED,AHEAD,BEHIND}_AMOUNT

INDEX=$(git status --porcelain -b -uall 2> /dev/null)

# Amount of untracked files
UNTRACKED_AMOUNT="$(echo "$INDEX" | grep -c -E '^\?\? ')"
# Amount of added/staged files
ADDED_AMOUNT="$(echo "$INDEX" | grep -c '^A[ MDAU] ')" || \
  ADDED_AMOUNT="$(echo "$INDEX" | grep -c '^M[ MD] ')" || \
  ADDED_AMOUNT="$(echo "$INDEX" | grep -c '^UA')"
# Amount of modified files
MODIFIED_AMOUNT="$(echo "$INDEX" | grep -c '^[ MARC]M ')"
# Amount of renamed files
RENAMED_AMOUNT="$(echo "$INDEX" | grep -c '^R[ MD] ')"
# Amount of deleted files
DELETED_AMOUNT="$(echo "$INDEX" | grep -c '^[MARCDU ]D ')" || \
DELETED_AMOUNT="$(echo "$INDEX" | grep -c '^D[ UM] ')"
# Amount of unmerged files
UNMERGED_AMOUNT="$(echo "$INDEX" | grep -c '^U[UDA] ')" || \
UNMERGED_AMOUNT="$(echo "$INDEX" | grep -c '^AA ')" || \
UNMERGED_AMOUNT="$(echo "$INDEX" | grep -c '^DD ')" || \
UNMERGED_AMOUNT="$(echo "$INDEX" | grep -c '^[DA]U ')"
# Amount of ahed branch
AHEAD_AMOUNT="$(echo "$INDEX" | grep -c '^## [^ ]\+ .*ahead')"
# Amount of behind branch
BEHIND_AMOUNT="$(echo "$INDEX" | grep -c '^## [^ ]\+ .*behind')"

SPACESHIP_GIT_STATUS_UNTRACKED=" "$UNTRACKED_AMOUNT" "
SPACESHIP_GIT_STATUS_ADDED="洛"$ADDED_AMOUNT" "
SPACESHIP_GIT_STATUS_MODIFIED=" "$MODIFIED_AMOUNT" "
SPACESHIP_GIT_STATUS_RENAMED="凜"$RENAMED_AMOUNT" "
SPACESHIP_GIT_STATUS_DELETED=" "$DELETED_AMOUNT" "
SPACESHIP_GIT_STATUS_UNMERGED=" "$UNMERGED_AMOUNT" "
SPACESHIP_GIT_STATUS_AHEAD="﯁ "$AHEAD_AMOUNT" "
SPACESHIP_GIT_STATUS_BEHIND="﮾ "$BEHIND_AMOUNT" "
SPACESHIP_GIT_STATUS_STASHED="藍"
SPACESHIP_GIT_STATUS_DIVERGED=" "
}
 
# End of git_stat_num #

# Left prompt sections
SPACESHIP_PROMPT_ORDER=(
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git_stat_num  # git_status but with extra number
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
