#!/usr/bin/env bash

# Enable expansion
shopt -s extglob

SOURCE_DIR=$(realpath "$(dirname $0)")
EXCLUDE=("deploy.sh" "README.md")

echo "These files will be deployed to:" 
echo -e "(Backup your files first before doing this operation)\n"
for f in $(ls $SOURCE_DIR); do
  if [[ ! "${EXCLUDE[@]}" =~ "$f" ]]; then
    echo "$f -> ~/.$f"
  fi
done

echo "Continue [y/n]"
read input

if [[ $input == "y" ]]; then
  for f in $(ls $SOURCE_DIR); do
      # Only link that's not in exclude list
    if [[ ! "${EXCLUDE[@]}" =~ "$f" ]]; then
      # Check if dir exist and it's not a symlink
      # If yes then only link the content
      # Else link the dir
      [[ -d ~/."$f" && ! -L ~/."$f" ]] && \
        ln -snf "$SOURCE_DIR"/"$f"/* "$HOME"/."$f"/ || \
        ln -snf "$SOURCE_DIR"/"$f" "$HOME"/."$f"
    fi
  done
fi
