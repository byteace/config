HISTSIZE=5000
EDITOR=vim
PAGER=less
export LC_ALL=en_US.UTF-8

# Use PROMPT_COMMAND instead of command substitution for git prompt
if [ $(id -u) -eq 0 ]; then
  PROMPT_COMMAND='__git_ps1 "\[\033]0;$TITLEPREFIX:$PWD\007\]\n\[\033[31m\]\u@\h \[\033[33m\]\w\[\033[36m\]" "\[\033[0m\]\n# " " '$'\uE0A0'' %s"'
else
  PROMPT_COMMAND='__git_ps1 "\[\033]0;$TITLEPREFIX:$PWD\007\]\n\[\033[32m\]\u@\h \[\033[33m\]\w\[\033[36m\]" "\[\033[0m\]\n$ " " '$'\uE0A0'' %s"'
fi

[ -f /etc/bash_completion ] && source /etc/bash_completion

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias v="vim"
alias vim="nvim"

alias t="tmux"

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

if command -v /mnt/c/Windows/System32/clip.exe >/dev/null 2>&1; then
  alias pbcopy='clip.exe'
  alias pbpaste='powershell.exe -c Get-Clipboard'
fi

command -v batcat >/dev/null 2>&1 && alias bat='batcat'
command -v fdfind >/dev/null 2>&1 && alias fd='fdfind'

alias c="cd /mnt/c"
alias d="cd /mnt/d"
alias e="cd /mnt/e"
alias f="cd /mnt/f"

for file in \
  "/etc/bash_completion" \
  "/usr/share/git/completion/git-completion.bash" \
  "/usr/share/git/completion/git-prompt.sh" \
  "/mingw/share/git/completion/git-completion.bash" \
  "/mingw/share/git/completion/git-prompt.sh" \
  "$HOME/.bashrc.local" \
  "$HOME/.env"; do
  [ -f "$file" ] && . "$file"
done

if command -v dircolors >/dev/null 2>&1; then
  eval "$(dircolors ~/.dircolors)"
fi

alias cls="clear && printf '\e[3J'"
