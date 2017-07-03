# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

PATH=~/.local/bin:~/.local/sbin:$PATH

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
    notify-send "${message}"
}

# oh-my-zsh plugins
plugins=(git)

export DISPLAY=:0

source $ZSH/oh-my-zsh.sh
