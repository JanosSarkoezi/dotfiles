# Dotfiles

Meine persönlichen Konfigurationsdateien, verwaltet mit [GNU Stow](https://www.gnu.org/software/stow/).

## Anwendung

Um die Dotfiles auf deinem System anzuwenden, führe folgende Befehle aus:

```bash
git clone <DEINE_REPO_URL> ~/.dotfiles
cd ~/.dotfiles
stow --adopt .
git checkout .
```
