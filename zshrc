# The following lines were added by compinstall
autoload -U run-help
autoload run-help-git
autoload run-help-svn
autoload run-help-svk
unalias run-help
alias help=run-help

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'r:|[._-/\]=** r:|=**' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} r:|[._-/\]=** r:|=**'
zstyle ':completion:*' menu select
zstyle ':completion:*' original true
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl true
zstyle :compinstall filename '/home/case/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory nomatch
unsetopt autocd beep extendedglob notify
bindkey -v
bindkey    "^[[3~"          delete-char
bindkey    "^[3;5~"         delete-char

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
# End of lines configured by zsh-newuser-install
autoload -U compinit promptinit
compinit
promptinit


# Adapted from code found at <https://gist.github.com/1712320>.

setopt prompt_subst
autoload -U colors && colors # Enable colors in prompt

# Modify the colors and symbols in these variables as desired.
GIT_PROMPT_SYMBOL="%{$fg[blue]%}±"
GIT_PROMPT_PREFIX="%{$fg[green]%}[%{$reset_color%}"
GIT_PROMPT_SUFFIX="%{$fg[green]%}]%{$reset_color%}"
GIT_PROMPT_AHEAD="%{$fg[red]%}ANUM%{$reset_color%}"
GIT_PROMPT_BEHIND="%{$fg[cyan]%}BNUM%{$reset_color%}"
GIT_PROMPT_MERGING="%{$fg_bold[magenta]%}⚡︎%{$reset_color%}"
GIT_PROMPT_UNTRACKED="%{$fg_bold[red]%}●%{$reset_color%}"
GIT_PROMPT_MODIFIED="%{$fg_bold[yellow]%}●%{$reset_color%}"
GIT_PROMPT_STAGED="%{$fg_bold[green]%}●%{$reset_color%}"

# Show Git branch/tag, or name-rev if on detached head
parse_git_branch() {
      (git symbolic-ref -q HEAD || git name-rev --name-only --no-undefined --always HEAD) 2> /dev/null
}

# Show different symbols as appropriate for various Git repository states
parse_git_state() {

      # Compose this value via multiple conditional appends.
      local GIT_STATE=""

            local NUM_AHEAD="$(git log --oneline @{u}.. 2> /dev/null | wc -l | tr -d ' ')"
              if [ "$NUM_AHEAD" -gt 0 ]; then
                      GIT_STATE=$GIT_STATE${GIT_PROMPT_AHEAD//NUM/$NUM_AHEAD}
        fi

              local NUM_BEHIND="$(git log --oneline ..@{u} 2> /dev/null | wc -l | tr -d ' ')"
                if [ "$NUM_BEHIND" -gt 0 ]; then
                        GIT_STATE=$GIT_STATE${GIT_PROMPT_BEHIND//NUM/$NUM_BEHIND}
          fi

                local GIT_DIR="$(git rev-parse --git-dir 2> /dev/null)"
                  if [ -n $GIT_DIR ] && test -r $GIT_DIR/MERGE_HEAD; then
                          GIT_STATE=$GIT_STATE$GIT_PROMPT_MERGING
                                fi

                                  if [[ -n $(git ls-files --other --exclude-standard 2> /dev/null) ]]; then
                                          GIT_STATE=$GIT_STATE$GIT_PROMPT_UNTRACKED
                                                fi

                                                  if ! git diff --quiet 2> /dev/null; then
                                                          GIT_STATE=$GIT_STATE$GIT_PROMPT_MODIFIED
                                                                fi

                                                                  if ! git diff --cached --quiet 2> /dev/null; then
                                                                          GIT_STATE=$GIT_STATE$GIT_PROMPT_STAGED
                                                                                fi

                                                                                  if [[ -n $GIT_STATE ]]; then
                                                                                          echo "$GIT_PROMPT_PREFIX$GIT_STATE$GIT_PROMPT_SUFFIX"
                                                                                                fi

}

# If inside a Git repository, print its branch and state
git_prompt_string() {
      local git_where="$(parse_git_branch)"
            [ -n "$git_where" ] && echo "$GIT_PROMPT_SYMBOL$(parse_git_state)$GIT_PROMPT_PREFIX%{$fg[yellow]%}${git_where#(refs/heads/|tags/)}$GIT_PROMPT_SUFFIX"
}

# Set the right-hand prompt
RPS1='$(git_prompt_string)'

autoload -U colors && colors

zstyle ':completion:*' menu select
setopt completealiases

setopt HIST_IGNORE_DUPS

# bind UP and DOWN arrow keys (compatibility fallback
# for Ubuntu 12.04, Fedora 21, and MacOSX 10.9 users)
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
# This will set the default prompt to the walters theme

alias ls='ls --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias ll='ls -l --group-directories-first --human-readable --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias la='ls -la --group-directories-first --human-readable --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias grep='grep --color=tty -d skip'


alias ls='ls --color=auto'
alias tor="sudo -u tor tor"
alias pacman-clean='pacman -Qdtq | sudo pacman -Rs -'
alias x='startx /bin/i3'
alias tor-renew="(echo authenticate '""'; echo signal newnym; echo quit) | nc localhost 9051"
alias wow='wine /home/case/Desktop/ExcaliburWoW\ Burning\ Crusade\ 2.4.3\ -\ With\ Basic\ AddOns/Wow.exe'
alias dwarf='nohup /home/case/Desktop/dwarfFortress/startlnp &'

export EDITOR=/usr/bin/vim
export GOPATH=~/go

PROMPT='[%n@%F{cyan}%m%f %c]%F{green} >>%f '
eval "$(fasd --init auto)"
alias j=z
alias telegram='nohup /home/case/Telegram/Telegram &'
alias wildstar='WINEPREFIX=~/wildstar/ wine wildstar/drive_c/Program\ Files\ \(x86\)/NCSOFT/WildStar/Wildstar.exe &'
alias ise='/home/case/Xilinx/14.7/ISE_DS/ISE/bin/lin64/ise &'
export BROWSER="vivaldi-stable"
