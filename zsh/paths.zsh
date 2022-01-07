
####### GPG
export GPG_TTY=$(tty)



####### GO
# export GOPATH=$HOME/code/go-workspace
# export GOBIN=$GOPATH/bin
# export GOROOT=/usr/local/opt/go/libexec
# export PATH=$PATH:$GOBIN
# export PATH=$PATH:$GOROOT/bin


####### GO GVM
source "$HOME/.gvm/scripts/gvm"



####### K8s
export KUBECONFIG="$(ls -d ${HOME}/.kube/contexts/* | paste -sd ':' -)"



####### NODE NVM
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm



####### PYTHON PYENV
eval "$(pyenv init -)"
PATH=$(pyenv root)/shims:$PATH



###### ZSH
source ~/.powerlevel10k/powerlevel10k.zsh-theme

