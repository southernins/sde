#!/bin/sh

# Bash shell "typicall" loads .bash_aliases out of the box
# note "typically"  please verify this before use.
if [ -r ~/.bashrc ]; then

  # move aliases file to home directory
  cp -i ./aliases/.bash_aliases ~/.bash_aliases

  # source the alias file for the current session
  . ~/.bash_aliases
fi


# Mac OS Big Sur uses zsh instead of bash.
# you need to add loading of .zsh_aliases in .zshrc for this to work
if [ -r ~/.zshrc ]; then

  # move aliases file to home directory
  cp -i ./aliases/.bash_aliases ~/.zsh_aliases

  # source the alias file for the current session
  . ~/.zsh_aliases
fi