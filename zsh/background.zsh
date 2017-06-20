if [[ -n "$ITERM_SESSION_ID" ]]; then
  function change-tab-color() {
    echo -ne "\033]6;1;bg;red;brightness;$1\a"
    echo -ne "\033]6;1;bg;green;brightness;$2\a"
    echo -ne "\033]6;1;bg;blue;brightness;$3\a"
  }

  function change-profile() {
    echo -ne "\033]50;SetProfile=$1\a"
  }

  function reset-colors() {
    echo -ne "\033]6;1;bg;*;Default\a"
    change-profile Default
  }

  function colorssh() {
    if [[ "$1" =~ "^ssh " ]]; then
      if [[ "$*" =~ "web*|production|ec2-.*compute-1" ]]; then
        change-profile SSH
        change-tab-color 255 0 0
      fi
    else
      reset-colors
    fi
  }

  autoload -U add-zsh-hook
  add-zsh-hook precmd  reset-colors
  add-zsh-hook preexec colorssh
fi
