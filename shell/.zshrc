ZSH=$HOME/.oh-my-zsh

# You can change the theme with another one:
#   https://github.com/robbyrussell/oh-my-zsh/wiki/themes
ZSH_THEME="robbyrussell"
BAT_THEME="Nord"

# Load zsh identities with ssh-agent plugins
zstyle ':omz:plugins:ssh-agent' identities 'klauhait_rsa' 'aubinlrx_rsa' 'id_rsa' 'winddle_infra.pem' 'winddle_internal.pem' 'winddle_web_ubuntu.pem'

# Useful plugins for Rails development with Sublime Text
plugins=(git ssh-agent history-substring-search zsh-syntax-highlighting)

# Prevent Homebrew from reporting - https://github.com/Homebrew/brew/blob/master/share/doc/homebrew/Analytics.md
export HOMEBREW_NO_ANALYTICS=1
export BREW_PREFIX="$(brew --prefix)"
export EDITOR="nvim"
export TERM="xterm-256color"

# Actually load Oh-My-Zsh
source "${ZSH}/oh-my-zsh.sh"

# Load kiex if installed
test -s "${HOME}/.kiex/scripts/kiex" && source "${HOME}/.kiex/scripts/kiex"

# add NodeJS into the PATH
export PATH=$PATH:"./bin:./node_modules"
export PATH=$PATH:/usr/local/opt/node@10/bin
export PATH=$PATH:/usr/local/opt/node@8/bin
export PATH=$PATH:/usr/local/sbin

# libffi - compile ruby
export LDFLAGS="-L$BREW_PREFIX/opt/libffi/lib"
export CPPFLAGS="-I$BREW_PREFIX/opt/libffi/include"
export PKG_CONFIG_PATH="$BREW_PREFIX/opt/libffi/lib/pkgconfig"

# openssl
export PATH="$BREW_PREFIX/opt/openssl@1.1/bin:$PATH"
export LDFLAGS="-L$BREW_PREFIX/opt/openssl@1.1/lib"
export CPPFLAGS="-I$BREW_PREFIX/opt/openssl@1.1/include"
export PKG_CONFIG_PATH="$BREW_PREFIX/opt/openssl@1.1/lib/pkgconfig"
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$BREW_PREFIX/opt/openssl@1.1"

# [OSX] 5.7 from brew
export PATH="$BREW_PREFIX/opt/mysql@5.7/bin:$PATH"

# add golang into the PATH
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/usr/local/go/bin

# Load nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$BREW_PREFIX/opt/nvm/nvm.sh" ] && . "$BREW_PREFIX/opt/nvm/nvm.sh" # This loads nvm
[ -s "$BREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" ] && . "$BREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion

# Store your own aliases in the ~/.aliases file and load the here.
[[ -f "$HOME/.aliases" ]] && source "$HOME/.aliases"

# Store your private tokens in the ~/.token file and load them here
[[ -f "$HOME/.private_tokens" ]] && source "$HOME/.private_tokens"

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

eval "$(rbenv init - zsh)"

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


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/aubinlrx/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/aubinlrx/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/aubinlrx/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/aubinlrx/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
