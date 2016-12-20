#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias ll='ls -l --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias la='ls -la --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias grep='grep --color=tty -d skip'


alias ls='ls --color=auto'
#PS1="[\u@\[\e[1;36m\]\h\[\e[0m\] \W] >>"
PS1="[\u@\[\e[1;36m\]\h\[\e[0m\] \W] \[\e[1;32m\]>>\[\e[0m\] "
alias tor="sudo -u tor tor"
alias pacman-clean='pacman -Qdtq | sudo pacman -Rs -'
alias x='startx /bin/i3'
alias tor-renew="(echo authenticate '""'; echo signal newnym; echo quit) | nc localhost 9051"
alias wow='wine /home/case/Desktop/ExcaliburWoW\ Burning\ Crusade\ 2.4.3\ -\ With\ Basic\ AddOns/Wow.exe'
alias dwarf='nohup /home/case/Desktop/dwarfFortress/startlnp &'

# Gotham Shell
#GOTHAM_SHELL="$HOME/.config/gotham/gotham.sh"
#[[ -s $GOTHAM_SHELL  ]] && source $GOTHAM_SHELL
