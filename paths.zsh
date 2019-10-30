

####### GO

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



