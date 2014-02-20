# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

bindkey -v

# really fucking tired of autocorrect
unsetopt correct_all

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="minimal"
alias tmux="export TERM=screen-256color-bce; tmux"

# jhbuild's gstreamer ain't got mp3 going for it
alias muzak="sudo su enoch -c rhythmbox > /dev/null"

# kill caps when it's on
alias FUCKCAPSLOCK="python -c 'from ctypes import *; X11 = cdll.LoadLibrary(\"libX11.so.6\"); display = X11.XOpenDisplay(None); X11.XkbLockModifiers(display, c_uint(0x0100), c_uint(2), c_uint(0)); X11.XCloseDisplay(display)'"

alias vt="vim ~/.todo/todo.txt ~/.todo/done.txt ~/.todo/report.txt -O"
alias t="todo.sh"
alias tl="todo.sh ls"
alias ta="todo.sh a"

alias gt="gnome-terminal"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

PATH=$PATH:~/.local/bin
export DISPLAY=:0

source $ZSH/oh-my-zsh.sh
export PATH=$PATH:~/.cabal/bin:~/.xmonad/bin
export DEBEMAIL="will@endlessm.com"

source ~/.profile
