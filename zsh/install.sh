#!/usr/bin/env bash
brew install zsh

if ! grep -q "$(which zsh)" /etc/shells
then
  echo "Adding $(which zsh) to /etc/shells as recommended by Homebrew"
  echo "$(which zsh)" | sudo tee -a /etc/shells > /dev/null
fi

if [ $(which zsh) != "$SHELL" ]
then
  echo "It seems you're still on $SHELL, let's switch to $(which zsh)"
  chsh -s $(which zsh)
  echo "Changes will become effective when you start a new shell."
fi
