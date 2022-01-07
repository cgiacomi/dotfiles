#!/usr/bin/env bash

set -e

# Ask for the sudo permission upfront and keep valid until EOF
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

script_path="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"



# XCODE command line tools
if ! type xcode-select >&- && xpath=$( xcode-select --print-path ) &&
   test -d "${xpath}" && test -x "${xpath}"; then
   echo "Command line tools not installed. Install and run script again."
   xcode-select --install
   EXIT
fi



# BREW
if ! command -v brew >/dev/null; then
  curl -fsSL 'https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh' | ruby
  export PATH="/opt/homebrew/bin:$PATH"
fi

if ! brew bundle check --file="$script_path/bin/Brewfile" >/dev/null; then
  brew bundle install --file="$script_path/bin/Brewfile" --force --no-lock
fi



# NVM
if ! command -v nvm >/dev/null; then
  curl -o- 'https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh' | bash
fi



# GO GVM
bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)


# OH MY ZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


# Move needed files
ln -s git/.gitconfig $HOME/.gitconfig
ln -s git/.gitignore_global $HOME/.gitignore_global

ln -s zsh/.zsh $HOME/.zsh
ln -s zsh/.p10k.zsh $HOME/.p10k.zsh
ln -s zsh/.zsh_aliases $HOME/.zsh_aliases
ln -s zsh/.zsh_paths $HOME/.zsh_paths

