# GRC colorizes nifty unix tools all over the place
if (( $+commands[grc] )) && (( $+commands[brew] ))
then
  source `brew --prefix`/etc/grc.zsh
fi

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
