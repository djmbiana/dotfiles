# ~/.bashrc: executed by bash(1) for non-login shells.

export PATH="$HOME/.nix-profile/bin:$PATH"

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# History settings
HISTCONTROL=ignoreboth
HISTSIZE=10000
HISTFILESIZE=20000
shopt -s histappend

# Check window size after each command
shopt -s checkwinsize

# Better directory navigation
shopt -s autocd
shopt -s cdspell
shopt -s dirspell

# Chroot identification
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# Enable color support
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto -la'
    alias grep='grep --color=auto'
fi

# aliases
alias ll='ls -lh'
alias la='ls -lAh'
alias vim='nvim'
alias ff='fastfetch'
alias sbmd='ssh -N -L 3002:localhost:3000 derrick@192.168.122.10'
export MANPAGER='nvim +Man!'
export VISUAL=nvim
export EDITOR=nvim
set -o vi

# tmux sessions
alias t='tmux'
alias ta='tmux attach -t'
alias tl='tmux ls'
alias td='tmux detach'
alias tn='tmux new -s'
alias tk='tmux attach || tmux'
alias tks='tmux kill-session -t'

# Load bash aliases if exists
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Enable bash completion
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Better tab completion
bind 'set completion-ignore-case on'
bind 'set show-all-if-ambiguous on'
bind 'set mark-symlinked-directories on'
bind 'set colored-stats on'
bind 'set visible-stats on'
bind 'set page-completions off'
bind 'set completion-query-items 200'

# Function to get git branch
git_branch() {
    git branch 2>/dev/null | grep '^*' | cut -d' ' -f2
}

# Prompt with git branch (shows only in git repos)
PS1='\[\033[38;5;245m\]\u@\h\[\033[00m\] \[\033[01;34m\]\w\[\033[00m\]$(branch=$(git_branch) && [ -n "$branch" ] && echo " \[\033[38;5;242m\]($branch)\[\033[00m\]") λ '


# Vi mode indicators
bind 'set show-mode-in-prompt on'
bind 'set vi-ins-mode-string \1\e[6 q\2'
bind 'set vi-cmd-mode-string \1\e[2 q\2'
PROMPT_COMMAND='echo -ne "\e[6 q"'
