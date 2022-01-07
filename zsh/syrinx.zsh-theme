autoload -U colors && colors

###### aliases

alias ll="ls -a -o"


###### SWIFT alias

alias swift="PATH=/System/Library/Frameworks/Python.framework/Versions/Current/bin:$PATH swift"


###### Python alias

alias python='python3'





####### set CLICOLORS

export CLICOLOR=1
export LSCOLORS=Exfxcxdxbxegedabagacad





####### Set the prompt

local git_branch='$(git_prompt_info)'

# ZSH_THEME_GIT_PROMPT_PREFIX="%F{yellow}‹"
# ZSH_THEME_GIT_PROMPT_SUFFIX="› %f"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "

ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"


PROMPT=$'\n'"🚀 %{$fg[magenta]%}%n%{$reset_color%}:%{$fg[yellow]%}%~%{$reset_color%} ${git_branch}
%{$fg[blue]%}❱%{$reset_color%} "


export LC_CTYPE=en_US.UTF-8



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

