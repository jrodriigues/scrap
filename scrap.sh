#!/bin/bash

# Ensure SCRAP_HOME is set
if [ -z "$SCRAP_HOME" ]; then
  echo "SCRAP_HOME is not set. Please set it to the appropriate directory."
  exit 1
fi

case $1 in
  "-h"|"--help")
    echo """
    Scrap is an installation script that is supported on Linux and macOS (amd64 or arm64).
    
    It can be used to install common tools and utilities.
    """
    ;;
  "asdf")
    if [ -f $SCRAP_HOME/lib/asdf.sh ]; then
      . "$SCRAP_HOME/lib/asdf.sh"
    else
      echo "File $SCRAP_HOME/lib/asdf.sh not found."
      exit 1
    fi
    install_asdf $2
    ;;
  "fzf")
    if [ -f $SCRAP_HOME/lib/fzf.sh ]; then
      . "$SCRAP_HOME/lib/fzf.sh"
    else
      echo "File $SCRAP_HOME/lib/fzf.sh not found."
      exit 1
    fi
    install_fzf $2
    ;;
esac
    
exit $?