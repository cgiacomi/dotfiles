
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


###### aliases

alias ls="ls -a -o"
source ~/.aliases

alias slime='open -a "Sublime Text 2"'


####### set CLICOLORS

export CLICOLOR=1
export LSCOLORS=exfxcxdxbxegedabagacad


######## set the prompt

PS1="\[$txtpur\]\h\[$txtgrn\]: \[$txtylw\]\w \[$txtblu\]$ \[$txtrst\]"


######## RVM

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*


######## set RVM path

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting


######## set autoconf

PATH=$rvm_path/bin:$PATH


######## kdiff3

export PATH=/Applications/kdiff3.app/Contents/MacOS:$PATH


######## set ruby version

rvm use ruby-1.9.3-p327


######## PostgreSQL

export PATH="/usr/local/bin:$PATH"


####### Brew Path

export PATH=/usr/local/sbin:$PATH


