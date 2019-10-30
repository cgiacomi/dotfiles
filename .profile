######## colors

txtblk='\e[0;30m' # Black - Regular
txtred='\e[0;31m' # Red
txtgrn='\e[0;32m' # Green
txtylw='\e[0;33m' # Yellow
txtblu='\e[0;34m' # Blue
txtpur='\e[0;35m' # Purple
txtcyn='\e[0;36m' # Cyan
txtwht='\e[0;37m' # White
bldblk='\e[1;30m' # Black - Bold
bldred='\e[1;31m' # Red
bldgrn='\e[1;32m' # Green
bldylw='\e[1;33m' # Yellow
bldblu='\e[1;34m' # Blue
bldpur='\e[1;35m' # Purple
bldcyn='\e[1;36m' # Cyan
bldwht='\e[1;37m' # White
unkblk='\e[4;30m' # Black - Underline
undred='\e[4;31m' # Red
undgrn='\e[4;32m' # Green
undylw='\e[4;33m' # Yellow
undblu='\e[4;34m' # Blue
undpur='\e[4;35m' # Purple
undcyn='\e[4;36m' # Cyan
undwht='\e[4;37m' # White
bakblk='\e[40m'   # Black - Background
bakred='\e[41m'   # Red
badgrn='\e[42m'   # Green
bakylw='\e[43m'   # Yellow
bakblu='\e[44m'   # Blue
bakpur='\e[45m'   # Purple
bakcyn='\e[46m'   # Cyan
bakwht='\e[47m'   # White
txtrst='\e[0m'    # Text Reset


prompt_git() {
  local s='';
  local branchName='';

  # Check if the current directory is in a Git repository.
  if [ $(git rev-parse --is-inside-work-tree &>/dev/null; echo "${?}") == '0' ]; then

    # check if the current directory is in .git before running git checks
    if [ "$(git rev-parse --is-inside-git-dir 2> /dev/null)" == 'false' ]; then

      # Ensure the index is up to date.
      git update-index --really-refresh -q &>/dev/null;

      # Check for uncommitted changes in the index.
      if ! $(git diff --quiet --ignore-submodules --cached); then
        s+='+';
      fi;

      # Check for unstaged changes.
      if ! $(git diff-files --quiet --ignore-submodules --); then
        s+='!';
      fi;

      # Check for untracked files.
      if [ -n "$(git ls-files --others --exclude-standard)" ]; then
        s+='?';
      fi;

      # Check for stashed files.
      if $(git rev-parse --verify refs/stash &>/dev/null); then
        s+='$';
      fi;

    fi;

    # Get the short symbolic ref.
    # If HEAD isn’t a symbolic ref, get the short SHA for the latest commit
    # Otherwise, just give up.
    branchName="$(git symbolic-ref --quiet --short HEAD 2> /dev/null || \
      git rev-parse --short HEAD 2> /dev/null || \
      echo '(unknown)')";

    [ -n "${s}" ] && s=" [${s}]";

    echo -e "${1}${branchName}${2}${s}";
  else
    return;
  fi;
}


export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8


###### aliases

alias ll="ls -a -o"


###### SWIFT alias

alias swift="PATH=/System/Library/Frameworks/Python.framework/Versions/Current/bin:$PATH swift"


###### Python alias

alias python='python3'



####### set CLICOLORS

export CLICOLOR=1
export LSCOLORS=Exfxcxdxbxegedabagacad



######## set the prompt

## primary single line
#PS1="\[$txtpur\]\h\[$txtgrn\]: \[$txtylw\]\w \[$txtred\]\$(vcprompt)\[$txtblu\]$\[$txtrst\] "

## alternate multiline
#PS1="\n\[$txtpur\]\u\[$txtrst\]:\[$txtylw\]\w \[$txtred\]\$(vcprompt)\n\[$txtblu\]❱\[$txtrst\] "

PS1="\n\[$txtpur\]\u\[$txtrst\]:\[$txtylw\]\w"
PS1+="\$(prompt_git \"\[$txtwht\] on \[$txtpur\]\" \"\[$txtcyn\]\")"; # Git repository details
PS1+="\n\[$txtblu\]❱\[$txtrst\] "
export PS1



######## Local

export PATH=~/.local/bin:$PATH



######## BIN

export PATH=~/.bin:$PATH



######## NODEJS

export PATH=/usr/local/bin:$PATH



######## kdiff3

export PATH=/Applications/kdiff3.app/Contents/MacOS:$PATH



######## GO LANG

export GOPATH=$HOME/code/go-workspace
export GOBIN=$GOPATH/bin
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOBIN
export PATH=$PATH:$GOROOT/bin



######## GITUB TOKEN

export GITHUB_TOKEN=xxx



######## TERRAFORM

export TF_VAR_digitalocean_token=xxx
export TF_VAR_ssh_fingerprint=xxx



####### BREW BASH AUTOCOMPLETE

#if [ -f $(brew --prefix)/etc/bash_completion ]; then
#. $(brew --prefix)/etc/bash_completion
#fi
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion



####### BREW PHP-VERSION
#source $(brew --prefix php-version)/php-version.sh && php-version 7.1.14
export PATH="/usr/local/opt/php@7.3/bin:$PATH"
export PATH="/usr/local/opt/php@7.3/sbin:$PATH"
export PATH="~/.composer/vendor/bin:$PATH"



####### NVM VERSION
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm



####### RVM VERSION
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*



# Setting PATH for Python 3.7
# The original version is saved in .profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:${PATH}"
export PATH
