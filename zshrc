PATH=~/.local/bin:~/.local/sbin:$PATH:~/go/bin

zstyle ':completion:*' menu select=2

export EDITOR=vim

bindkey -v

# really fucking tired of autocorrect
unsetopt correct_all

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
PROJ_DIR=$HOME/dev
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
    reply=($(find $PROJ_DIR -maxdepth 2 | awk -F "$PROJ_DIR/" '{print $2}' | grep "$1"))
}
compctl -U -K _goto_cpl goto

wdiff() {
  diff -s <(curl -s $1) <(curl -s $2)
}

bindkey -v
bindkey '^R' history-incremental-search-backward

alias alert=notify-send done

alias ipa='ip a s label "[^br][^veth]*"'

setopt inc_append_history
setopt share_history

export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="minimal"
plugins=(git)
source $ZSH/oh-my-zsh.sh
source $HOME/.cargo/env

export GOPATH=$HOME/go
