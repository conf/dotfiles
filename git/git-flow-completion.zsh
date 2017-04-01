# Explicitly source git flow completion (if it exists)

completion="$(brew --prefix)/share/zsh/site-functions/git-flow-completion.zsh"

if test -f $completion
then
  source $completion
fi

# Ignore FETCH_HEAD on completion
zstyle ':completion:*:*' ignored-patterns '*FETCH_HEAD'
