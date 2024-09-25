# My Config

## Includes

- Neovim
- Wezterm
- Oh-My-Posh
- Bashrc

## Location

All files are placed in the ~/.dotfiles/
And I use [stow]{https://www.gnu.org/software/stow/manual/stow.html} to create all Symlinks

# Dependencies

## Git

```
sudo apt install git
```

## Stow

```
sudo apt install stow
```

## Installation

First, check out the dotfiles repo in your $HOME directory using git

```
git clone https://github.com/CookieNinjaLabs/.dotfiles.git
cd .dotfiles
```

then use GNU stow to create symlinks

```
stow .
```
