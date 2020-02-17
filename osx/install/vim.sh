#!usr/bin/env bash

echo "vim setup started..."

DOTFILES="${HOME}/git/aubinlrx/dotfiles"
BASE_DIR="$HOME/.vim"
PLUGIN_DIR="$BASE_DIR/bundle"
COLORS_DIR="$BASE_DIR/colors"
AUTOLOAD_DIR="$BASE_DIR/autoload"
AFTER_DIR="$BASE_DIR/after"
PLUGINS=(
  "tpope/vim-fugitive"
  "junegunn/gv.vim"
  "kien/ctrlp.vim"
  "vim-airline/vim-airline"
  "vim-airline/vim-airline-themes"
  "scrooloose/nerdtree"
  "Xuyuanp/nerdtree-git-plugin"
  "Yggdroot/indentLine"
  "tpope/vim-surround"
  "tpope/vim-pathogen"
  "terryma/vim-multiple-cursors"
  "airblade/vim-gitgutter"
  "leafgarland/typescript-vim"
  "bigfish/vim-js-context-coloring"
  "neoclide/vim-jsx-improve"
  "posva/vim-vue"
  "Quramy/vim-js-pretty-template"
  "altercation/vim-colors-solarized"
  "matze/vim-move"
  "fatih/vim-go"
  "sheerun/vim-polyglot"
  "dracula/vim"
)

mkdir -p $PLUGIN_DIR
mkdir -p $COLORS_DIR
mkdir -p $AUTOLOAD_DIR
mkdir -p $AFTER_DIR

# vim
echo "symlink .vimrc"
ln -fs ${DOTFILES}/vim/.vimrc ${HOME}/.vimrc

for PLUGIN in ${PLUGINS[@]}; do
   DIRNAME="$(basename $PLUGIN)"
   git clone https://github.com/$PLUGIN.git $PLUGIN_DIR/$DIRNAME
done

cp $PLUGIN_DIR/vim-pathogen/autoload/pathogen.vim $AUTOLOAD_DIR/pathogen.vim

echo "vim setup done"
