autoload -U colors && colors

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
