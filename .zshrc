autoload -U colors && colors


###### aliases

alias ll="ls -a -o"


###### SWIFT alias

alias swift="PATH=/System/Library/Frameworks/Python.framework/Versions/Current/bin:$PATH swift"


###### Python alias

alias python='python3'





####### Set the prompt

PS1=$'\n'"🤖 %{$fg[magenta]%}%n%{$reset_color%}:%{$fg[yellow]%}%~%{$reset_color%}"
PS1+=$'\n'"%{$fg[blue]%}❱%{$reset_color%} "
export PS1




######## Local

export PATH=~/.local/bin:$PATH



######## BIN

export PATH=~/.bin:$PATH



######## NODEJS

export PATH=/usr/local/bin:$PATH



######## kdiff3

export PATH=/Applications/kdiff3.app/Contents/MacOS:$PATH



####### GO LANG

export GOPATH=$HOME/code/go-workspace
export GOBIN=$GOPATH/bin
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOBIN
export PATH=$PATH:$GOROOT/bin



####### NVM VERSION

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm



####### PYTHON

# Setting PATH for Python 3.7
# The original version is saved in .profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:${PATH}"
export PATH

