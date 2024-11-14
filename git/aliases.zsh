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

alias gpr='gh pr create -a @me --fill-verbose -w'
alias gmr='glab mr create -w --fill --fill-commit-body --draft --push -a aleksey.shein'
alias gd='git diff'
alias gc='git checkout'
alias gcm='git checkout $(git rev-parse --abbrev-ref origin/HEAD | cut -f2 -d/)'
alias gb='git branch'
alias gs='git status -sb'
alias ga='git add'
alias gau='ga -u'
alias gaa='ga -A'
alias gk='gitk --all &'
alias gcb='git copy-branch-name'

git_branch() {
  git symbolic-ref --short HEAD 2>/dev/null
}

has_tracking_branch() {
  git rev-parse --abbrev-ref @{u} > /dev/null 2>&1
}
