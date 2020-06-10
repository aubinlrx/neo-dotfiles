ZSH=$HOME/.oh-my-zsh

# You can change the theme with another one:
#   https://github.com/robbyrussell/oh-my-zsh/wiki/themes
ZSH_THEME="robbyrussell"

# Load zsh identities with ssh-agent plugins
zstyle ':omz:plugins:ssh-agent' identities 'id_rsa' 'aubinlrx_rsa'

# Useful plugins for Rails development with Sublime Text
plugins=(git ssh-agent history-substring-search zsh-syntax-highlighting)

export EDITOR="vim"
export TERM="xterm-256color"

# Actually load Oh-My-Zsh
source "${ZSH}/oh-my-zsh.sh"

# Add ~/bin to PATH
export PATH=$PATH:$HOME/bin

# Load golang into the PATH
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/usr/local/go/bin

# Load rust into the PATH
export PATH=$PATH:$HOME/.cargo/bin

# Load nvm
export NVM_DIR="$HOME/.nvm"
[[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Load kiex if installed
[[ -s "${HOME}/.kiex/scripts/kiex" ]] && source "${HOME}/.kiex/scripts/kiex"

# Store your own aliases in the ~/.aliases file and load them here.
[[ -s "$HOME/.aliases" ]] && source "$HOME/.aliases"

# Tmux config
set -g default-terminal "screen-256color"

# Encoding stuff for the terminal
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
