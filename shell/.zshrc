ZSH=$HOME/.oh-my-zsh

# You can change the theme with another one:
#   https://github.com/robbyrussell/oh-my-zsh/wiki/themes
ZSH_THEME="robbyrussell"

# Load zsh identities with ssh-agent plugins
zstyle ':omz:plugins:ssh-agent' identities 'id_rsa' 'winddle_rsa'

# Useful plugins for Rails development with Sublime Text
plugins=(git ssh-agent history-substring-search zsh-syntax-highlighting)

# Prevent Homebrew from reporting - https://github.com/Homebrew/brew/blob/master/share/doc/homebrew/Analytics.md
export HOMEBREW_NO_ANALYTICS=1
export EDITOR="vim"
export TERM="xterm-256color"

# Actually load Oh-My-Zsh
source "${ZSH}/oh-my-zsh.sh"

# Load rbenv if installed
# export PATH="${HOME}/.rbenv/bin:${HOME}/.rbenv/shims:${PATH}"
# type -a rbenv > /dev/null && eval "$(rbenv init -)"

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" 

# Load kiex if installed
test -s "${HOME}/.kiex/scripts/kiex" && source "${HOME}/.kiex/scripts/kiex"

# add NodeJS into the PATH
export PATH=$PATH:"./bin:./node_modules"
export PATH=$PATH:/usr/local/opt/node@10/bin
export PATH=$PATH:/usr/local/opt/node@8/bin
export PATH=$PATH:/usr/local/sbin

# [OSX] add openssl into path
export LIBRARY_PATH=$LIBRARY_PATH:/usr/local/opt/openssl/lib/

# [OSX] add Qt binary to PATH
# https://github.com/thoughtbot/capybara-webkit/wiki/Installing-Qt-and-compiling-capybara-webkit#macos-high-sierra-1013-macos-sierra-1012-el-capitan-1011-and-yosemite-1010
export PATH="$(brew --prefix qt@5.5)/bin:$PATH"

# [OSX] https://blog.francium.tech/installing-rmagick-on-osx-high-sierra-7ea71f57390d
export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"

# [OSX] 5.7 from brew
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"

# add golang into the PATH 
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/usr/local/go/bin

# Load nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && . "$(brew --prefix)/opt/nvm/nvm.sh" # This loads nvm
[ -s "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" ] && . "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion

# Store your own aliases in the ~/.aliases file and load the here.
[[ -f "$HOME/.aliases" ]] && source "$HOME/.aliases"

# Tmux config
set -g default-terminal "screen-256color"

# Encoding stuff for the terminal
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8


# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
