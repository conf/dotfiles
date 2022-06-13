#!/bin/bash
#
# Homebrew
#
# This installs some of the common dependencies needed (or at least desired)
# using Homebrew.

# Ask permissions upfront
sudo -v
# Check for Homebrew
if test ! $(which brew)
then
  echo "  Installing Homebrew for you."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  echo -n "  Updating..."
  brew update
  echo "  Upgrading..."
  brew upgrade
fi

# Install homebrew packages
brew install grc coreutils the_silver_searcher homebrew/dupes/grep git imagemagick wget
brew install openssl tree watch
brew install psgrep

# brew cask install google-chrome dropbox 1password karabiner iterm2 slack tunnelbear
# brew cask install skype zoomus grammarly vagrant lastpass

exit 0
