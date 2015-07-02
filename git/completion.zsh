# Explicitly source git flow completion (if it exists)

set -e

completion="$(brew --prefix)/share/zsh/site-functions/git-flow-completion.zsh"

if test -f $completion
then
  source $completion
fi
