HISTSIZE=5000
EDITOR=vim
PAGER=less

if [ $(id -u) -eq 0 ]; then
	PS1='\[\033]0;$TITLEPREFIX:$PWD\007\]\n\[\033[31m\]\u@\h \[\033[33m\]\w\[\033[36m\]$(__git_ps1 "  %s")\[\033[0m\]\n# '
else
	PS1='\[\033]0;$TITLEPREFIX:$PWD\007\]\n\[\033[32m\]\u@\h \[\033[33m\]\w\[\033[36m\]$(__git_ps1 "  %s")\[\033[0m\]\n$ '
fi

[ -f /etc/bash_completion ] && source /etc/bash_completion

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

command -v nvim >/dev/null && alias vim=nvim
alias v="vim"

alias t="tmux"

alias ls="ls --color=auto"
alias l="ls"
alias ll="ls -l"
alias la="ls -a"
alias lla="ls -la"

alias gc="git checkout"
alias gcm="git checkout master"
alias gp="git pull"
alias gs="git status"
alias gco="git commit"
alias ga="git add -A ."
alias gl="git log"
alias gd="git diff"
alias grh="git reset --hard HEAD"
alias grm="git rebase master"
alias grim="git rebase -i master"
alias gfa="git fetch --all"

alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
setup_config() {
	git clone --bare https://github.com/byteace/config ~/.cfg
	cd ~/.cfg
	config config --local status.showUntrackedFiles no
}

[ -f ~/.bashrc.local ] && source ~/.bashrc.local

