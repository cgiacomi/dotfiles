#!/usr/bin/env bash

set -e

# Ask for the sudo permission upfront and keep valid until EOF
sudo -v
# while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

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

if ! brew bundle check --file="$script_path/homebrew/Brewfile" >/dev/null; then
  brew bundle install --file="$script_path/homebrew/Brewfile" --force --no-lock
fi



# NVM
if [ ! -d "$HOME/.nvm" ]; # if ! command -v nvm >/dev/null; then
  curl -o- 'https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh' | bash
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
fi



# GO GVM
if [ ! -d "$HOME/.gvm" ]; then
  bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
fi



# OH MY ZSH
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi



# Copy all the fonts
cp -rv ./fonts $HOME/Library/Fonts



# POWERLEVEL10K Theme
if [ ! -d "$HOME/.oh-my-zsh/custom/themes/powerlevel10k" ]; then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
fi



# Move needed files
ln -fs $script_path/git/.gitconfig $HOME/.gitconfig
ln -fs $script_path/git/.gitignore_global $HOME/.gitignore_global

ln -fs $script_path/zsh/.p10k.zsh $HOME/.p10k.zsh
ln -fs $script_path/zsh/.zsh_aliases $HOME/.zsh_aliases
ln -fs $script_path/zsh/.zsh_paths $HOME/.zsh_paths
ln -fs $script_path/zsh/.zshrc $HOME/.zshrc



# Use touchID for sudo permission
cat /etc/pam.d/sudo | grep "pam_tid.so" || sudo gsed -i '3 i auth       sufficient     pam_tid.so' /etc/pam.d/sudo



# Reload all the configurations
source $HOME/.zshrc



# Install default version for Go, Node and Python
gvm install go1.17.6
nvm install v16.13.1
pyenv install 3.10.0