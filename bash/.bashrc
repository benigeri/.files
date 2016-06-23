### Standard stuff ###
if [[ $- != *i* ]] ; then
	# Shell is non-interactive, return now.
	return
fi

export EDITOR=vim
export REACT_EDITOR=vim

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

export PATH=$PATH:~/bin

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

source ~/.colors
function color_my_prompt {
    local user_and_host="\[${Yellow}\]\u@\h"
    local current_location="\[${Cyan}\]\w"
    local git_branch_color="\[${Red}\]"
    local git_branch='`git branch 2> /dev/null | grep -e ^* | sed -E  s/^\\\\\*\ \(.+\)$/\(\\\\\1\)\ /`'
    local prompt_tail="\[${Purple}\]$"
    local last_color="\[${off}\]"
    export PS1="$current_location $git_branch_color$git_branch$prompt_tail$last_color "
}
color_my_prompt

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

#BASH Helpers
# alias ls='ls -G --color'
# alias ll='ls -l'
# alias la='ls -A'
# alias l='ls -CF'
# alias countfiles='for t in files links directories; do echo `find . -type ${t:0:1} | wc -l` $t; done 2> /dev/null'

# Git function to commit and push
cap() {
  git add . ;
  git commit -m "$1";
  git pull;
  git push;
}

caph() {
	git add . ;
  git commit -m "$1";
  git pull;
  git push;
	git push heroku master;
}

# Tmuxifier
export PATH="$HOME/.tmuxifier/bin:$PATH"
eval "$(tmuxifier init -)"

# Alist hub so it wraps git
eval "$(hub alias -s)"

