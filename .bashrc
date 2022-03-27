#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#alias ls='ls --color=auto'
alias waltop-tablet='xinput map-to-output `xinput list --id-only "WALTOP International Corp. Media Tablet Pen (0)"` DP-2'
alias zelda-ds4='ds4drv --hidraw --udp --trackpad-mouse --led 000000 --battery-flash'
alias drevo-fn-on='echo 0 | sudo tee /sys/module/hid_apple/parameters/fnmode'
#alias drevo-fn-off='echo 1 | sudo tee /sys/module/hid_apple/parameters/fnmode'
alias dwm-compile='cd ~/git/dwm; sudo make clean install'
#alias ytdl-music='youtube-dl -x --audio-format mp3 --audio-quality 0 --add-metadata --embed-thumbnail'
alias ytdl-music='yt-dlp -x --audio-format mp3 --audio-quality 0 --add-metadata --embed-thumbnail'
alias weather='curl wttr.in/Szczecin'
alias get_idf='. $IDF_PATH/export.sh'
alias config='/usr/bin/git --git-dir=$HOME/git/config/ --work-tree=$HOME'

#PS1='\e[1;33m\u@\h \W \$ \e[m'
PS1='\[\e[1;33m\] \W \$ \[\e[m\]'

# Changing ls to exa
alias ls='exa -l --color=always --group-directories-first'     # my preferred listing
alias la='exa -a --color=always --group-directories-first'      # all files and dirs
alias ll='exa -al --color=always --group-directories-first'      # long format
alias lt='exa -aT --color=always --group-directories-first'     # tree listing
alias l.='exa -a | egrep "^\."'                                 # listing dotfiles

# vim and emacs
alias vim='nvim'
alias em='/usr/bin/emacs -nw'
alias emacs='emacsclient -c -a "emacs"'
alias doomsync='~/.emacs.d/bin/doom sync'
alias doomdoctor='~/.emacs.d/bin/doom doctor'
alias doomupgrade='~/.emacs.d/bin/doom upgrade'
alias doompurge='~/.emacs.d/bin/doom purge'

ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

export EDITOR="/bin/nvim"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export PATH="$PATH:/home/akinhet/.local/bin"
export IDF_PATH="$HOME/git/esp-idf"
export LESSHISTFILE="/home/akinhet/.cache/less/history"

### Random color script ###
colorscript random
