
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

alias ls=lsd
alias lh='lsd -lh'
if (( $+commands[vivid] ))
then
  export LS_COLORS="$(vivid generate one-dark)"
fi
