#!/bin/sh
#
# Homebrew
#
# This installs some of the common dependencies needed (or at least desired)
# using Homebrew.

# Check for Homebrew
if test ! $(which brew)
then
  echo "  Installing Homebrew for you."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  echo "  Update Homebrew packages..."
  brew update
fi

# Install homebrew packages
brew install grc coreutils the_silver_searcher homebrew/dupes/grep git imagemagick wget
brew install openssl node

# we need java for elasticsearch
brew install Caskroom/cask/java
brew install homebrew/versions/elasticsearch17

brew install postgresql

brew cask install google-chrome dropbox 1password karabiner iterm2 slack tunnelbear
brew cask install skype zoomus

exit 0
