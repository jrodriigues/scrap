install_asdf() {
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
      asdf-install [VERSION]

  Arguments:
      VERSION: The version of asdf to install. Ex: 0.16.0
      
  Opts:
      -h, --help       Show this help message and exit.
      -U, --uninstall  Uninstall asdf.
      """
      exit 0
      ;;
    "-U"|"--uninstall")
      rm -rf $HOME/.local/bin/asdf
      echo "asdf has been uninstalled successfully."
      exit 0
      ;;
  esac

  if [ -f $HOME/.local/bin/asdf ]; then
    echo "asdf is already installed. Uninstall it first using -U|--uninstall."
    exit 1
  fi

  echo "Installing asdf..."

  curl -fsSL "https://github.com/asdf-vm/asdf/releases/download/v${1}/asdf-v${1}-${PLATFORM}-${ARCH}.tar.gz" \
       -o /tmp/asdf.tar.gz

  if [ $? -ne 0 ]; then
    echo "Failed to download asdf v$1."
    exit 1
  fi

  if [ ! -d $HOME/.local/bin ]; then
    mkdir -p $HOME/.local/bin
  fi

  tar -xf /tmp/asdf.tar.gz -C $HOME/.local/bin && rm /tmp/asdf.tar.gz

  asdf reshim
  echo "asdf v$1 has been installed successfully."
  exit 0
}