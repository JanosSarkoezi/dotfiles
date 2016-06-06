all: fzf elinks oh-my-zsh todo.txt-cli base16-gnome-terminal gist/tarruda/5158535 vim/autoload

fzf:
	cd fzf; git pull; ./install --all; cd ..

elinks:
	cd elinks; git pull; cd ..

oh-my-zsh:
	cd oh-my-zsh; git pull; cd ..

todo.txt-cli:
	cd todo.txt-cli; git pull; cd ..

base16-gnome-terminal:
	cd base16-gnome-terminal; git pull; cd ..

gist/tarruda/5158535:
	cd gist/tarruda/5158535; git pull; cd ..

vim/autoload:
	cd vim/autoload; git pull; cd ..

.PHONY: fzf elinks oh-my-zsh todo.txt-cli base16-gnome-terminal gist/tarruda/5158535 vim/autoload

