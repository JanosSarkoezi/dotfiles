# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/.local/go/bin" ] ; then
    PATH="$HOME/.local/go/bin:$PATH"
fi

if [ -d "$HOME/.local/r2/bin" ] ; then
    export R2_PREFIX="$HOME/.local/r2"
    export R2PM_PREFIX="$R2_PREFIX"
    export R2PM_GITDIR="$R2_PREFIX/share/radare2/r2pm/git"
    export R2PM_PLUGDIR="$R2_PREFIX/lib/radare2/last/plugins"

    # Nur einen Pfad exportieren, um die "Already loaded"-Warnung zu minimieren
    export R2_USER_PLUGINS="$R2PM_PLUGDIR"

    export PATH="$R2_PREFIX/bin:$PATH"
    export LD_LIBRARY_PATH="$R2_PREFIX/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"

    # Symlink nur erstellen, wenn er noch nicht da ist
    if [ ! -L "$HOME/.local/share/radare2" ]; then
        mkdir -p "$HOME/.local/share"
        rm -rf "$HOME/.local/share/radare2" # Letztes Mal aufräumen
        ln -s "$R2_PREFIX/lib/radare2/last" "$HOME/.local/share/radare2"
    fi
fi

# if [ -d "$HOME/.local/r2/bin" ] ; then
#     export R2_PREFIX="$HOME/.local/r2"
#     export R2PM_PREFIX="$R2_PREFIX"
#     
#     # Pfade für r2pm Tools und Build-Umgebung
#     export R2PM_BINDIR="$R2_PREFIX/bin"
#     export R2PM_LIBDIR="$R2_PREFIX/lib"
#     export R2PM_INCDIR="$R2_PREFIX/include"
#     export R2PM_MANDIR="$R2_PREFIX/share/man"
#     
#     # Plugin-Pfade (Die "Wahrheit" für r2pm UND das r2-Binary)
#     export R2PM_PLUGDIR="$R2_PREFIX/lib/radare2/last/plugins"
#     export R2_USER_PLUGINS="$R2PM_PLUGDIR"
#     export R2_LIBR_PLUGINS="$R2PM_PLUGDIR"
#     
#     # Datenbank und Git
#     export R2PM_GITDIR="$R2_PREFIX/share/radare2/r2pm/git"
#     # R2PM_DBDIR weglassen, damit r2pm es relativ zum GITDIR findet (unser Fix!)
# 
#     # System-Pfade
#     export PATH="$R2_PREFIX/bin:$PATH"
#     export LD_LIBRARY_PATH="$R2_PREFIX/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
# fi

. "$HOME/.cargo/env"
