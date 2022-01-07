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

brew bundle install --file="$script_path/bin/Brewfile" --force --no-lock



#TODO: install GVM

if ! command -v nvm >/dev/null; then
  curl -o- 'https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh' | bash
fi

#NOTE: PYENV installed via homebrew


for file in $script_path/*; do
  if [ -d ${file} ]; then
    stow --no-folding --target $HOME --dir $script_path -R "$(basename $file)"
  fi
done

