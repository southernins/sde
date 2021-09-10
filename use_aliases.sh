#!/bin/sh

if [ -r ~/.bashrc ]; then

  # move aliases file to home directory
  cp -i ./aliases/.bash_aliases ~/.bash_aliases

  # source the alias file for the current session
  . ~/.bash_aliases
fi