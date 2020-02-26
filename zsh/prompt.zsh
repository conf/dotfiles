autoload colors && colors
# cheers, @ehrenmurdick
# http://github.com/ehrenmurdick/config/blob/master/zsh/prompt.zsh

if (( $+commands[git] ))
then
  git="$commands[git]"
else
  git="/usr/bin/git"
fi

git_branch() {
  $git symbolic-ref --short HEAD 2>/dev/null
}

has_tracking_branch() {
 $git rev-parse --abbrev-ref @{u} > /dev/null 2>&1
}

inside_git() {
  $git rev-parse --is-inside-work-tree > /dev/null 2>&1
}

git_dirty() {
  inside_git || return
  if [[ $($git status --porcelain -uno) == "" ]]
  then
    branch_color="green"
  else
    branch_color="red"
  fi

  echo " on %{$fg_bold[$branch_color]%}$(git_branch)%{$reset_color%}"
}

unpushed () {
  $git cherry -v @{upstream} 2>/dev/null
}

need_push () {
  if [[ $(unpushed) != "" ]]
  then
    echo " with %{$fg_bold[magenta]%}unpushed%{$reset_color%}"
  fi
}

ruby_version() {
  if (( $+commands[rbenv] ))
  then
    echo "$(rbenv version | awk '{print $1}')"
  fi

  if (( $+commands[rvm-prompt] ))
  then
    echo "$(rvm-prompt | awk '{print $1}')"
  fi
}

rb_prompt() {
  if ! [[ -z "$(ruby_version)" ]]
  then
    echo "%{$fg_bold[yellow]%}$(ruby_version)%{$reset_color%} "
  else
    echo ""
  fi
}

node_prompt() {
  if (( $+commands[node] ))
  then
    echo "%{$fg_bold[green]%}$(nvm current)%{$reset_color%} "
  else
    echo ""
  fi
}

directory_name() {
  echo "%{$fg_bold[cyan]%}%~%{$reset_color%}"
}

function preexec() {
  timer=$(($(gdate +%s%0N)/1000000000.0))
}

function precmd() {
  if [ $timer ]; then
    now=$(($(gdate +%s%0N)/1000000000.0))
    elapsed="$(($now-$timer))"

    if (( $elapsed > 0.01 )); then
      elapsed=$(printf ' %.02fs' $elapsed)
    else
      elapsed=""
    fi

    unset timer
  fi
}

export PROMPT='$(rb_prompt)$(node_prompt)in $(directory_name)$(git_dirty)$(need_push)%F{cyan}${elapsed}%{$fg_bold[red]%} ♥%{$reset_color%} '
