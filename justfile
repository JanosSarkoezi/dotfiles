install: apt zsh cargo fzf node nerdfont kitty

# sudo apt install ...
apt:
    sudo apt install atool apt-file build-essential curl \
    git graphviz openjdk-11-jdk openjdk-17-jdk \
    openjdk-21-jdk openjdk-8-jdk locate sxiv vlc \
    x11-xkb-utils xclip zathura zsh ncdu conky-all \
    compton feh j4-dmenu-desktop
    # sudo apt-file update

updatedb:
    sudo updatedb

# Setzt zsh als standard und installiert oh-my-zsh
zsh:
    [ "$SHELL" = "$(command -v zsh)" ] && echo "Zsh ist als Standard-Shell gesetzt" || chsh -s $(which zsh)
    [ -d "$HOME/.oh-my-zsh" ] && echo "Oh My Zsh ist installiert" || sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# installiert cargo und Programme mit cargo
cargo:
    [ -x "$(command -v cargo)" ] && echo "Cargo ist installiert" || curl https://sh.rustup.rs -sSf | sh
    cargo install tree-sitter-cli ripgrep fd-find
    cargo install zoxide --locked

# Installiet fzf
fzf:
    #!/usr/bin/env bash
    if [ -d "$HOME/.fzf" ]; then
        cd ~/.fzf && git pull && ./install --all
    else
        git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
        ~/.fzf/install --all
    fi

# Installiert nerdfont Hack.
nerdfont:
    #!/usr/bin/env bash
    mkdir -p ~/.local/share/fonts
    cd ~/.local/share/fonts
    curl -LO https://github.com/source-foundry/Hack/releases/download/v3.003/Hack-v3.003-ttf.zip
    curl -LO https://github.com/JetBrains/JetBrainsMono/releases/download/v2.304/JetBrainsMono-2.304.zip
    atool -x Hack-v3.003-ttf.zip
    atool -x JetBrainsMono-2.304.zip

# Installiert nvm
nvm:
    [ -d "$HOME/.nvm" ] && echo "NVM ist installiert" || curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash

# Installiert Node.js
node: nvm
    [ -x "$(command -v node)" ] && echo "Node.js ist installiert" || nvm install 22
    node -v
    npm -v
    npm install -g neovim

# Installiert kitty
kitty:
    curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
    ln -sf ~/.local/kitty.app/bin/kitty ~/.local/kitty.app/bin/kitten ~/.local/bin/
    cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/
    cp ~/.local/kitty.app/share/applications/kitty-open.desktop ~/.local/share/applications/
    sed -i "s|Icon=kitty|Icon=$(readlink -f ~)/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty*.desktop
    sed -i "s|Exec=kitty|Exec=$(readlink -f ~)/.local/kitty.app/bin/kitty|g" ~/.local/share/applications/kitty*.desktop

# Installiert bspwm und sxhkd
bspwm:
    #!/usr/bin/env bash
    sudo apt install libxcb-xinerama0-dev libxcb-util-dev libxcb-icccm4-dev libxcb-randr0-dev libxcb-ewmh-dev libxcb-keysyms1-dev libxcb-shape0-dev
    mkdir -p ~/dev/git
    cd ~/dev/git
    if [ -d "$HOME/dev/git/bspwm" ]; then
        cd bspwm && git pull && make clean && make && make install PREFIX=~/.local && cd ..
    else
        git clone https://github.com/baskerville/bspwm
        cd bspwm && make install PREFIX=~/.local && cd ..
    fi
    if [ -d "$HOME/dev/git/sxhkd" ]; then
        cd sxhkd && git pull && make clean && make && make install PREFIX=~/.local && cd ..
    else
        git clone https://github.com/baskerville/sxhkd
        cd sxhkd && make install PREFIX=~/.local && cd ..
    fi
    tee -a /tmp/bspwm.desktop <<EOF
    [Desktop Entry]
    Name=bspwm
    Comment=Binary space partition window manager
    Exec=bspwm
    Type=Application
    EOF
    sudo cp /tmp/bspwm.desktop /usr/share/xsession

tmux:
    #!/usr/bin/env zsh
    sudo apt-get -y install autoconf automake \
        bison build-essential curl git libevent-dev \
        libncurses5-dev pkg-config git
    if [ -d tmux ]; then
        cd tmux && git checkout 3.5
    else
        git clone https://github.com/tmux/tmux.git
        cd tmux && git checkout 3.5 && ./autogen.sh
    fi
    ./configure --prefix=$HOME/.local && make install

dmenu:
    #!/usr/bin/env bash
    sudo apt install libxinerama-dev libxft-dev
    mkdir -p ~/dev/git
    cd ~/dev/git
    if [ -d "$HOME/dev/git/dmenu" ]; then
        cd dmenu && git pull && make clean && make && make install PREFIX=~/.local
    else
        git clone git://git.suckless.org/dmenu
        cd dmenu && make && make install PREFIX=~/.local
    fi

crawl:
    #!/usr/bin/env bash
    sudo apt install build-essential libncursesw5-dev bison flex liblua5.1-0-dev \
    libsqlite3-dev libz-dev pkg-config python3-yaml binutils-gold python-is-python3
    sudo apt install libsdl2-image-dev libsdl2-mixer-dev libsdl2-dev \
    libfreetype6-dev libpng-dev fonts-dejavu-core advancecomp pngcrush
    mkdir -p ~/dev/git
    cd ~/dev/git
    if [ -d "$HOME/dev/git/crawl" ]; then
        cd crawl/crawl-ref/source && git pull && make clean && make -j$(nproc)
    else
        git clone git://git.suckless.org/dmenu
        cd dmenu && make && make install PREFIX=~/.local
    fi
