ZSH=$HOME/.oh-my-zsh

# You can change the theme with another one:
#   https://github.com/robbyrussell/oh-my-zsh/wiki/themes
ZSH_THEME="robbyrussell"
BAT_THEME="tokyo-night"

# Load zsh identities with ssh-agent plugins
zstyle ':omz:plugins:ssh-agent' identities 'aubinlrx_rsa' 'id_rsa' 'winddle_infra.pem' 'winddle_internal.pem' 'winddle_web_ubuntu.pem'

# Useful plugins for Rails development with Sublime Text
plugins=(git ssh-agent history-substring-search zsh-syntax-highlighting)

# Prevent Homebrew from reporting - https://github.com/Homebrew/brew/blob/master/share/doc/homebrew/Analytics.md
export HOMEBREW_NO_ANALYTICS=1
export EDITOR="nvim"
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
# export PATH="$(brew --prefix qt@5.5)/bin:$PATH"

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

# Ripgrep config
if type rg &> /dev/null; then
    export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --ignore-vcs -g "!{node_modules,.git}"'
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
fi

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="$HOME/.rvm/gems/ruby-2.6.2@winddle-rails5/bin:$PATH"
export PATH="$HOME/.gem/ruby/2.7.0/bin:$PATH"

# Add pip to PATH for Ansible
export PATH="$PATH:$HOME/Library/Python/2.7/bin"

# Winddle specific env variable
WINDDLE_APP_PATH="$HOME/git/winddle/winddle"

# Eternal history
# taken from https://unix.stackexchange.com/questions/273861/unlimited-history-in-zsh
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000000
SAVEHIST=10000000
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
setopt HIST_BEEP                 # Beep when accessing nonexistent history.

if [ -z "$SSH_AUTH_SOCK" ] ; then
  eval `ssh-agent -s`
fi

