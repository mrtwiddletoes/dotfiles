# Prezto
if [[ -s "${ZDOTDIR:-$HOME}/dotfiles/prezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/dotfiles/prezto/init.zsh"
fi

source ~/.tmuxinator.zsh

# Various Aliases
alias df="df -h --total"
alias u="cd .. && l"
alias du="du -h -d 2 -c -a"
alias v="vim"

# Applications
alias irc='irssi'
alias h="htop"
alias tmux="tmux -2"

# Configuration
alias zshrc="vim ~/dotfiles/zshrc"
alias vimrc="vim ~/dotfiles/vimrc"
alias dot="vim ~/random/dot.txt"
alias sou="source ~/.zshrc"

# Package Manager
alias upd="brew update"
alias upg="brew upgrade"
alias gupd="sudo gem update"

bindkey -v

export DYLD_FORCE_FLAT_NAMESPACE=1
export EDITOR='vim'
