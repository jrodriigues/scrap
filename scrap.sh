#!/bin/bash

SCRAP_HOME="~/scrap"

case $1 in
  "-h"|"--help")
    echo """
    Scrap is an installation script that is supported on Linux and macOS (amd64 or arm64).
    
    It can be used to install common tools and utilities.
    """
    ;;
  "asdf")
    source /home/jrodr/scrap/lib/asdf.sh
    install_asdf $2
    ;;
  "fzf")
    source /home/jrodr/scrap/lib//fzf.sh
    install_fzf $2
    ;;
esac
    
exit $?