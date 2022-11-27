# Dotfiles

## Layout

```
.
├── git/                                  # git config and global gitignore
├── osx/                                  # mac os preferences, installers and apps configs
├── shell/                                # bash config (prompt, aliases, functions, exports etc.)
├── ubuntu/                               # ubuntu preferences, installers and apps configs
├── nvim/                                 # neovim config and plugins
├── .gitignore
└── README.md
```

## OSX setup

```
mkdir git/aubinlrx
cd git/aubinlrx
git clone https://github.com/aubinlrx/neo-dotfiles.git
cd neo-dotfiles/osx
. ./setup.sh
```

## Ubuntu setup

```
sudo apt install git
mkdir git/aubinlrx
cd git/aubinlrx
git clone https://github.com/aubinlrx/neo-dotfiles.git
cd neo-dotfiles/ubuntu
. ./setup.sh
```
