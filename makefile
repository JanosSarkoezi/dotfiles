SHELL=zsh

update: fzf elinks oh-my-zsh todo.txt-cli base16-gnome-terminal gist/tarruda/5158535 vim/autoload

install:
	mkdir -p ~/.bin
	git submodule update --init --recursive
	ln -s ~/.dotfiles/zshrc ~/.zshrc
	ln -s ~/.dotfiles/tmux.conf ~/.tmux.conf
	ln -s ~/.dotfiles/elinks ~/.elinks
	ln -s ~/.dotfiles/fzf ~/.fzf
	ln -s ~/.dotfiles/oh-my-zsh ~/.oh-my-zsh
	ln -s ~/.dotfiles/vim ~/.vim
	ln -s ~/.dotfiles/vimrc ~/.vimrc
	ln -s ~/.dotfiles/vim ~/.nvim
	ln -s ~/.dotfiles/vimrc ~/.nvimrc
	ln -s ~/.dotfiles/themes ~/.dotfiles/oh-my-zsh/custom/themes
	ln -s ~/.dotfiles/gist/tarruda/5158535/vim-tmux-move.zsh ~/.bin/vim-tmux-move.zsh
	ln -s ~/.dotfiles/gist/tarruda/5158535/vim-tmux-xpaste.zsh ~/.bin/vim-tmux-xpaste.zsh
	ln -s ~/.dotfiles/gist/tarruda/5158535/vim-tmux-open.zsh ~/.bin/vim-tmux-open.zsh
	~/.fzf/install --all

fzf:
	pushd fzf; git pull; ~/.fzf/install --all; popd

elinks:
	pushd elinks; git pull; popd

oh-my-zsh:
	pushd oh-my-zsh; git pull; popd

todo.txt-cli:
	pushd todo.txt-cli; git pull; popd

base16-gnome-terminal:
	pushd base16-gnome-terminal; git pull; popd

gist/tarruda/5158535:
	pushd gist/tarruda/5158535; git pull; popd

vim/autoload:
	pushd vim/autoload; git pull; popd

.PHONY: fzf elinks oh-my-zsh todo.txt-cli base16-gnome-terminal gist/tarruda/5158535 vim/autoload install update
