install_lazygit() {
  PLATFORM=$(uname -s | tr '[:upper:]' '[:lower:]')
  ARCH=$(uname -m)
  if [ "$ARCH" == "x86_64" ]; then
    ARCH="amd64"
  elif [ "$ARCH" == "aarch64" ]; then
    ARCH="arm64"
  fi

  case $1 in
    "-h"|"--help")
      echo """
      This script supports versions >=0.16.0 only.

  Usage:
      scrap lazygit [VERSION]

  Arguments:
      VERSION: The version of lazygit to install. Ex: 0.16.0
      
  Opts:
      -h, --help       Show this help message and exit.
      -U, --uninstall  Uninstall lazygit.
      """
      exit 0
      ;;
    "-U"|"--uninstall")
      rm -rf $HOME/.local/bin/lazygit
      echo "lazygit has been uninstalled successfully."
      exit 0
      ;;
  esac

  if [ -f $HOME/.local/bin/lazygit ]; then
    echo "lazygit is already installed. Uninstall it first using -U|--uninstall."
    exit 1
  fi

  echo "Installing lazygit..."

  curl -fsSL "https://github.com/jesseduffield/lazygit/releases/download/v${1}/lazygit_${1}_${PLATFORM}_${ARCH}.tar.gz" \
       -o /tmp/lazygit.tar.gz

  if [ $? -ne 0 ]; then
    echo "Failed to download lazygit v$1."
    exit 1
  fi

  if [ ! -d $HOME/.local/bin ]; then
    mkdir -p $HOME/.local/bin
  fi

  tar -xf /tmp/lazygit.tar.gz -C $HOME/.local/bin && rm /tmp/lazygit.tar.gz

  echo "lazygit v$1 has been installed successfully."
  exit 0
}