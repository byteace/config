HISTSIZE=5000
EDITOR=vim
PAGER=less
export LC_ALL=en_US.UTF-8

if [ $(id -u) -eq 0 ]; then
	PS1='\[\033]0;$TITLEPREFIX:$PWD\007\]\n\[\033[31m\]\u@\h \[\033[33m\]\w\[\033[36m\]$(__git_ps1 "  %s")\[\033[0m\]\n# '
else
	PS1='\[\033]0;$TITLEPREFIX:$PWD\007\]\n\[\033[32m\]\u@\h \[\033[33m\]\w\[\033[36m\]$(__git_ps1 "  %s")\[\033[0m\]\n$ '
fi

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias v="vim"
alias vim="nvim"

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

alias oc="opencode"

alias config="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"

if command -v /mnt/c/Windows/System32/clip.exe >/dev/null 2>&1; then
    alias pbcopy='clip.exe'
    alias pbpaste='powershell.exe -c Get-Clipboard'
fi
alias c="cd /mnt/c"
alias d="cd /mnt/d"
alias e="cd /mnt/e"
alias f="cd /mnt/f"

for file in \
	"/etc/bash_completion" \
	"/usr/share/git/completion/git-completion.bash" \
	"/usr/share/git/completion/git-prompt.sh" \
	"$HOME/.bashrc.local" \
	"$HOME/.env"; do
	[ -f "$file" ] && . "$file"
done

eval "$(dircolors ~/.dircolors)"
