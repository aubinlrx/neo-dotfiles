ZSH=$HOME/.oh-my-zsh

# You can change the theme with another one:
#   https://github.com/robbyrussell/oh-my-zsh/wiki/themes
ZSH_THEME="robbyrussell"

# Useful plugins for Rails development with Sublime Text
plugins=(git ssh-agent zsh-syntax-highlighting history-substring-search)

# Prevent Homebrew from reporting - https://github.com/Homebrew/brew/blob/master/share/doc/homebrew/Analytics.md
export HOMEBREW_NO_ANALYTICS=1
export EDITOR="vim"
export TERM="xterm-256color"

# Actually load Oh-My-Zsh
source "${ZSH}/oh-my-zsh.sh"

# Load rbenv if installed
export PATH="${HOME}/.rbenv/bin:${HOME}/.rbenv/shims:${PATH}"
type -a rbenv > /dev/null && eval "$(rbenv init -)"

# Load kiex if installed
test -s "${HOME}/.kiex/scripts/kiex" && source "${HOME}/.kiex/scripts/kiex"

# add NodeJS into the PATH
export PATH=$PATH:"./bin:./node_modules"
export PATH=$PATH:/usr/local/opt/node@10/bin
export PATH=$PATH:/usr/local/opt/node@8/bin
export PATH=$PATH:/usr/local/sbin

# add golang into the PATH 
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/usr/local/go/bin

# Store your own aliases in the ~/.aliases file and load the here.
[[ -f "$HOME/.aliases" ]] && source "$HOME/.aliases"

# Tmux config
set -g default-terminal "screen-256color"

# Encoding stuff for the terminal
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

