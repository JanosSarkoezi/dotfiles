SHELL=zsh

update: fzf elinks oh-my-zsh todo.txt-cli base16-gnome-terminal gist/tarruda/5158535 vim/autoload

install:
	mkdir -p ~/.bin && \
	mkdir -p ~/.gitTemplate/hooks && \
	git submodule update --init --recursive && \
	ln -nsf ~/.dotfiles/zshrc ~/.zshrc && \
	ln -nsf ~/.dotfiles/tmux.conf ~/.tmux.conf && \
	ln -nsf ~/.dotfiles/elinks ~/.elinks && \
	ln -nsf ~/.dotfiles/fzf ~/.fzf && \
	ln -nsf ~/.dotfiles/oh-my-zsh ~/.oh-my-zsh && \
	ln -nsf ~/.dotfiles/vim ~/.vim && \
	ln -nsf ~/.dotfiles/vimrc ~/.vimrc && \
	ln -nsf ~/.dotfiles/vim ~/.nvim && \
	ln -nsf ~/.dotfiles/vimrc ~/.nvimrc && \
	ln -nsf ~/.dotfiles/themes ~/.dotfiles/oh-my-zsh/custom/themes && \
	ln -nsf ~/.dotfiles/gitTemplate/hooks/ctags ~/.gitTemplate/hooks/ctags && \
	ln -nsf ~/.dotfiles/gitTemplate/hooks/post-merge ~/.gitTemplate/hooks/post-merge && \
	ln -nsf ~/.dotfiles/gitTemplate/hooks/post-commit ~/.gitTemplate/hooks/post-commit && \
	ln -nsf ~/.dotfiles/gitTemplate/hooks/post-checkout ~/.gitTemplate/hooks/post-checkout && \
	ln -nsf ~/.dotfiles/gitTemplate/hooks/post-rewrite ~/.gitTemplate/hooks/post-rewrite && \
	ln -nsf ~/.dotfiles/gist/tarruda/5158535/vim-tmux-move.zsh ~/.bin/vim-tmux-move.zsh && \
	ln -nsf ~/.dotfiles/gist/tarruda/5158535/vim-tmux-xpaste.zsh ~/.bin/vim-tmux-xpaste.zsh && \
	ln -nsf ~/.dotfiles/gist/tarruda/5158535/vim-tmux-open.zsh ~/.bin/vim-tmux-open.zsh && \
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
