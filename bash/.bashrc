#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias dmesg='dmesg --color=auto'
alias grep='grep --color=auto'
alias gcc='gcc -fdiagnostics-color=auto'
alias pacman='pacman --color=auto'
alias dir='dir --color=auto'
alias diff='diff --color=auto'

alias ll='ls -lh'
alias la='ls -lah'
alias l='ls --group-directories-first -F'
alias h='history'
alias view='vim -R'

alias nc='env LANG=C nc'
alias xl='eza -bghHliS'
alias dux='ls -A | xargs -d "\n" du -hs | sort -hr'
#alias tlmgr='/usr/share/texmf-dist/scripts/texlive/tlmgr.pl --usermode'

#PS1='[\u@\h \W]\$ '
PS1='\[\e[1;36m\][\u@\h \W]\$\[\e[0m\] '

shopt -s histappend
export HISTSIZE=10000
export HISTFILESIZE=10000
export HISTTIMEFORMAT="%d/%m/%y %T "
export WINEARCH=win64
export WINEPREFIX=/home/iom/.wine
export WORKON_HOME=~/.virtualenvs
export PROJECT_HOME=~/projects
export LS_COLORS=$LS_COLORS:'ow=1;34:'
export SAL_USE_VCLPLUGIN=qt6

eval "$(zoxide init bash)"

bind 'set enable-bracketed-paste off'
