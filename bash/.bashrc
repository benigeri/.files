### Standard stuff ###
if [[ $- != *i* ]] ; then
	# Shell is non-interactive, return now.
	return
fi

export EDITOR=vim

HISTSIZE=10000

export PATH=$PATH:~/bin

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

alias colors='{
  echo -e -n "${black}black ${Black}Black ${on_white}${BLACK}BLACK$off "
  echo -e -n "${red}red ${Red}Red ${on_yellow}${RED}RED$off "
  echo -e -n "${green}green ${Green}Green ${on_blue}${GREEN}GREEN$off "
  echo -e -n "${yellow}yellow ${Yellow}Yellow ${on_red}${YELLOW}YELLOW$off "
  echo -e -n "${blue}blue ${Blue}Blue ${on_green}${BLUE}BLUE$off "
  echo -e -n "${purple}purple ${Purple}Purple ${on_cyan}${PURPLE}PURPLE$off "
  echo -e -n "${cyan}cyan ${Cyan}Cyan ${on_blue}${CYAN}CYAN$off "
  echo -e -n "${white}white ${White}White ${on_purple}${WHITE}WHITE$off \n"
}'

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
alias ls='ls -G'
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
alias countfiles='for t in files links directories; do echo `find . -type ${t:0:1} | wc -l` $t; done 2> /dev/null'

# git aliases

alias gpp="git pull; git push"
alias gp="git pull"
alias gpu="git push"
alias gs="git status"
alias ga="git add ."
alias gr="git reset --hard HEAD"
alias gg='git log --graph --pretty=format:"%Cred%h%Creset %Cgreen%ci%Creset %Cblue%an%Creset %s %C(red reverse)%d%Creset"'
alias ggh='gg|head'
alias gclean='git branch --merged master | grep -v "\* master" | xargs -n 1 git branch -d'

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

# Tmux stuff
alias tma='tmux attach -d -t'
alias git-tmux='tmux new -s $(basename $(pwd))'
alias tml='tmux ls'

# Tmuxifier
export PATH="$HOME/.tmuxifier/bin:$PATH"
eval "$(tmuxifier init -)"
alias ts='tmuxifier load-session'

# Backslash stuff
alias venv='. venv/bin/activate'
alias ngrok='~/ngrok -authtoken HvlLtHIF_fKDrbAAv5Fo -subdomain=elephantpoomother999 5000'
### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
