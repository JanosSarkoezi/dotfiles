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
	ln -s ~/.dotfiles/themes ~/.dotfiles/oh-my-zsh/custom/themes
	ln -s ~/.dotfiles/gist/tarruda/5158535/vim-tmux-move.zsh ~/.bin/vim-tmux-move.zsh
	ln -s ~/.dotfiles/gist/tarruda/5158535/vim-tmux-xpaste.zsh ~/.bin/vim-tmux-xpaste.zsh
	ln -s ~/.dotfiles/gist/tarruda/5158535/vim-tmux-open.zsh ~/.bin/vim-tmux-open.zsh
	~/.fzf/install --all

fzf:
	cd fzf
	git pull
	~/.fzf/install --all
	cd ..

elinks:
	cd elinks
	git pull
	cd ..

oh-my-zsh:
	cd oh-my-zsh
	git pull
	cd ..

todo.txt-cli:
	cd todo.txt-cli
	git pull
	cd ..

base16-gnome-terminal:
	cd base16-gnome-terminal
	git pull
	cd ..

gist/tarruda/5158535:
	cd gist/tarruda/5158535
	git pull
	cd ..

vim/autoload:
	cd vim/autoload
	git pull
	cd ..

.PHONY: fzf elinks oh-my-zsh todo.txt-cli base16-gnome-terminal gist/tarruda/5158535 vim/autoload install update
