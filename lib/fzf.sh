install_fzf() {
  PLATFORM=$(uname -s | tr '[:upper:]' '[:lower:]')
  ARCH=$(uname -m)
  if [ "$ARCH" == "x86_64" ]; then
    ARCH="amd64"
  elif [ "$ARCH" == "aarch64" ]; then
    ARCH="arm64"
  fi

  case $1 in
    "-h"|"--help")
      echo """Usage:
      scrap fzf [VERSION]

  Arguments:
      VERSION: The version of fzf to install.
      
  Opts:
      -h, --help       Show this help message and exit.
      -U, --uninstall  Uninstall fzf.
      """
      exit 0
      ;;
    "-U"|"--uninstall")
      rm -rf $HOME/.local/bin/fzf
      echo "fzf has been uninstalled successfully."
      exit 0
      ;;
  esac

  if [ -f $HOME/.local/bin/fzf ]; then
    echo "fzf is already installed. Uninstall it first using -U|--uninstall."
    exit 1
  fi

  echo "Installing fzf..."

  curl -fsSL "https://github.com/junegunn/fzf/releases/download/v${1}/fzf-${1}-${PLATFORM}_${ARCH}.tar.gz" \
       -o /tmp/fzf.tar.gz

  if [ $? -ne 0 ]; then
    echo "Failed to download fzf $1."
    exit 1
  fi

  if [ ! -d $HOME/.local/bin ]; then
    mkdir -p $HOME/.local/bin
  fi

  tar -xf /tmp/fzf.tar.gz -C $HOME/.local/bin && rm /tmp/fzf.tar.gz

  echo "fzf $1 has been installed successfully."
  exit 0
}
