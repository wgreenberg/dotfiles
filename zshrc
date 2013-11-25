# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

bindkey -v

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="minimal"
alias tmux="export TERM=screen-256color-bce; tmux"

#jhbuild reminder
if [ -z "$UNDER_JHBUILD" ]; then
  insults=('gluttonous' 'glutenous' 'flatulent' 'boil-brained' 'onion-eyed' 'overly hirsute' 'craven' 'raving' 'rancid' 'rank' 'cantankerous' 'pulchritudinous' 'moldy' 'molting' 'goat-kneading' 'MATLAB-loving' 'saucy' 'spicy' 'defenestrating' 'git-hating')
  num_insults=${#insults[*]}

  titles=('pincushion' 'fart-monger' 'malt-worm' "ne'er-do-well" 'lounge lizard' 'proprietary-software-user' 'rapscallion' 'curmudgeon' 'bladder' 'usurper' 'Avogadro-admirer' 'sheep-biter' 'pomegranate' 'durian' 'reaver' 'mountain of mad flesh' 'bureaucrat' 'catamite' 'codpiece' 'baseball-scorner')
  num_titles=${#titles[*]}

  echo "Run jhbuild shell you ${insults[$((RANDOM%$num_insults))]} ${titles[$((RANDOM%$num_titles))]}"
fi

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

PATH=$PATH:/home/endless/.local/bin
export DISPLAY=:0

source $ZSH/oh-my-zsh.sh
