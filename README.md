# Scrap

A small package manager for common utilities that is compatiable with Linux and MacOS.

Scrap works with any utility that can be installed as a single binary file. It will find the specified version, download it and install in a user defined location (defaults to `~/.local/bin`).

## Getting started

To install Scrap, you will need to clone the repo and symlink the file `scrap.sh` into a directory in your `$PATH`.
The below code will clone this repo to your `$HOME` directory and symlink the file to `/usr/local/bin`

```bash
cd
git clone git@github.com:jrodriigues/scrap.git
sudo ln -s ./scrap/scrap.sh /usr/local/bin
```

To update Scrap, just do a `git pull` on the repo.

The installation process will be reworked in the future.

## Plugins

| Name    | Supported Versions  |
|---------|---------------------|
| Lazygit | All                 |
| Asdf    | >= 0.16.0           |
| Fzf     | All                 |