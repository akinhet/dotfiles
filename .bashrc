#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ll='exa -al --color=always --group-directories-first'
alias la='exa -a --color=always --group-directories-first'
alias ls='exa -l --color=always --group-directories-first'
alias lt='exa -aT --color=always --group-directories-first'
alias l.='exa -a | egrep "^\."'
alias umount='sync; umount'
alias cdup='cd ..'
alias get_idf='. /opt/esp-idf/export.sh'
alias gryfino='killall'

alias ip='ip --color=auto'
alias diff='diff --color=auto'
alias grep='grep --color=auto'

export EDITOR="/bin/nvim"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export GIT_PAGER="bat -l gitlog -p --paging=always"
export MANROFFOPT="-c"

bind "set completion-ignore-case on"

eval "$(jump shell)"

#PS1='[\u@\h \W]\$ '
PS1='\[\e[1;33m\] \W \$ \[\e[m\]'

kwupload()
{
    for f in $@; do
        cat "$f" | pv | curl -H "Linx-Api-Key: Derpy" -T "-" "https://u.kwhost.org/upload/$(basename "$f")"        
    done
}

kwdownload()
{
    for f in $@; do
        curl -O http://u.kwhost.org/"$f"
    done
}


ex ()
{
  if [ -f "$1" ] ; then
    case "$1" in
      *.tar.bz2)   tar xjf "$1"   ;;
      *.tar.gz)    tar xzf "$1"   ;;
      *.bz2)       bunzip2 "$1"   ;;
      *.rar)       unrar x "$1"   ;;
      *.gz)        gunzip "$1"    ;;
      *.tar)       tar xf "$1"    ;;
      *.tbz2)      tar xjf "$1"   ;;
      *.tgz)       tar xzf "$1"   ;;
      *.zip)       unzip "$1"     ;;
      *.Z)         uncompress "$1";;
      *.7z)        7z x "$1"      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}


cal -3m
alias config='/usr/bin/git --git-dir=/home/akinhet/.cfg/ --work-tree=/home/akinhet'
