spaceship_git_stat(){
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
