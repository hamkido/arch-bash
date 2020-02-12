export ZSH="/home/hamki/.oh-my-zsh"
ZSH_THEME="fox"
DISABLE_AUTO_UPDATE="true"
plugins=(git zsh-syntax-highlighting zsh-autosuggestions )
source $ZSH/oh-my-zsh.sh
setopt HIST_IGNORE_DUPS
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_FIND_NO_DUPS
fortune | cowsay

