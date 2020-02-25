# Use `hub` as our git wrapper:
#   http://defunkt.github.com/hub/
hub_path=$(which hub)
if (( $+commands[hub] ))
then
  alias git=$hub_path
fi

# The rest of my fun git aliases
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
# these functions live in zsh/prompt.zsh
alias gp='git push $(has_tracking_branch || echo "-u origin $(git_branch)")'
alias gpr='$(has_tracking_branch) || git push -u origin $(git_branch) && hub pull-request -o -l wip -p -a conf'
alias gd='git diff'
alias go='git checkout'
alias gb='git branch'
alias gs='git status -sb'
alias ga='git add'
alias gau='ga -u'
alias gaa='ga -A'
alias gk='gitk --all &'
alias gcb='git copy-branch-name'
