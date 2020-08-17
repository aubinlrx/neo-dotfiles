# Load nvm
set -Ux NVM_DIR "$HOME/.nvm"
function nvm
    bass source "$NVM_DIR/nvm.sh" --no-use ';' nvm $argv
end
nvm use default --silent

# Set default EDITOR to Vim
set -Ux VISUAL vim
set -Ux EDITOR vim

# Load ~/bin into PATH
set PATH $PATH "$HOME/bin"

# Load golang
set -Ux GOPATH "$HOME/go"
set PATH $PATH "$GOPATH/bin"
set PATH $PATH "/usr/local/go/bin"

# Load rust
set PATH $PATH "$HOME/.cargo/bin"

# Load rvm
set PATH $PATH "$GEM_HOME/bin"
set PATH $PATH "$HOME/.rvm/bin"
rvm default

# Set aliases
alias ws="./bin/webpack-dev-server"
alias cdp="cd ~/git/aubinlrx/"
alias cdw="cd ~/git/winddle/"
alias cdww="cd ~/git/winddle/winddle"
alias cdwp="cd ~/git/winddle/winddle-peeps"
alias ryarn="rm -rf ./node_modules && yarn install"
alias rspec="bundle exec rspec"
alias fspec="SEED=disabled DRIVER=chrome RSPEC_RETRY_RETRY_COUNT=0 rspec"
alias cat="bat"
alias evim="vim ~/.config/nvim/init.vim"
alias efish="vim ~/.config/fish/config.fish"
alias db="./bin/db"
alias open="xdg-open"

# Load ssh keys
# ssh-add "$HOME/.ssh/id_rsa" "$HOME/.ssh/aubinlrx_rsa"
