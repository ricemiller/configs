#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

set -o vi

EDITOR='vim'


source /usr/share/git/completion/git-prompt.sh
export PATH="$PATH:$HOME/go/bin"


alias ls='ls --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias ll='ls -lh --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias la='ls -lah --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias grep='grep --color=tty -d skip'

GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWUPSTREAM='auto'

#PS1="[\u@\[\e[1;36m\]\h\[\e[0m\] \W] >>"
PS1='[\u@\[\e[1;36m\]\h\[\e[0m\] \W]$(__git_ps1 " (%s)") \[\e[1;32m\]>>\[\e[0m\] '
#PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
alias pacman-clean='pacman -Qdtq | sudo pacman -Rs -'
alias x='startx /bin/i3'
alias tor-renew="(echo authenticate '""'; echo signal newnym; echo quit) | nc localhost 9051"

eval "$(fasd --init auto)"
alias j='z'
