#!/bin/bash
# based on the SO answer here http://stackoverflow.com/a/38421283/273444
while read -r file
do
  dest="_$(basename -s .zsh-completion $file)"
  ln -svf "$file" "$dest"
done < <(find /Applications/Docker.app -type f -name '*.zsh-completion')
