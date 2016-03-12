# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

zstyle ':completion:*' menu select=2

bindkey -v

# really fucking tired of autocorrect
unsetopt correct_all

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="minimal"
alias tmux="export TERM=screen-256color-bce; tmux"

alias datafart='curl --data-binary @- datafart.com'

# jhbuild's gstreamer ain't got mp3 going for it
alias muzak="sudo su enoch -c rhythmbox > /dev/null"

# kill caps when it's on
alias FUCKCAPSLOCK="python -c 'from ctypes import *; X11 = cdll.LoadLibrary(\"libX11.so.6\"); display = X11.XOpenDisplay(None); X11.XkbLockModifiers(display, c_uint(0x0100), c_uint(2), c_uint(0)); X11.XCloseDisplay(display)'"

alias jot=$HOME/Documents/notes/jot
alias todo="jot todo"
alias t="todo"
_todo_cpl () {
    if [ -z $1 ]; then
        reply=($(ls $HOME/Documents/notes/*.md | xargs -n1 basename | sed 's/.md$//'))
    else
        reply=($(ls $HOME/Documents/notes/*.md | grep $1 | xargs -n1 basename | sed 's/.md$//'))
    fi
}
compctl -U -K _todo_cpl jot

alias gt="gnome-terminal"

alias vi="vim"

DISABLE_AUTO_UPDATE="true"

# hurl - curl but only headers
hurl () {
    curl -s -D - $1 -o /dev/null
}

# Setup goto function with autocompletion in projects directory
PROJ_DIR=$HOME/checkout
goto () {
    if [ -d $PROJ_DIR/$1 ]; then
        cd $PROJ_DIR/$1;
        if [ -d $PROJ_DIR/$1/.git ]; then
            git --no-pager log -n 1;
            git status;
        fi
    else
        echo "no dice"
    fi
}

_goto_cpl () {
    reply=($(ls $PROJ_DIR | py -fx "'${1}' in x"))
}
compctl -U -K _goto_cpl goto

# alert sends a notification, use after long running jobs
alert () {
    message=DONE
    if [ ! -z $1 ]; then
        message=$1
    fi
    zenity --notification --text=${message} --timeout=3
}

igrep () {
    case "$1" in
        -t|--today)
            TODAY=1
            SEARCH=$2
        ;;
        *)
            TODAY=0
            SEARCH=$1
        ;;
    esac
    IRC_LOGS_DIR=$HOME/.xchat2/xchatlogs
    if [ $TODAY -eq 1 ]; then
        grep "$(date +'%b %d')" $IRC_LOGS_DIR/*.log | grep $SEARCH
    else
        grep $SEARCH $IRC_LOGS_DIR/*.log
    fi
}

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

PATH=$PATH:~/.local/bin
export DISPLAY=:0

source $ZSH/oh-my-zsh.sh
export PATH=$PATH:~/.cabal/bin:~/.xmonad/bin
export DEBEMAIL="will@endlessm.com"

# Golang stuff
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/usr/local/go/bin
