# My Config

## Includes

- Neovim
- Wezterm
- Oh-My-Posh
- Bashrc

## Location

All files are placed in the ~/.dotfiles/ folder.

And I use [stow](https://www.gnu.org/software/stow/manual/stow.html) to create all Symlinks.

# Dependencies

External Requirements:

- Wezterm: [wezterm](https://wezfurlong.org/wezterm/install/linux.html)
- Basic utils: `git`, `make`, `unzip`, C Compiler (`gcc`)
- [ripgrep](https://github.com/BurntSushi/ripgrep#installation)
- Clipboard tool (xclip/xsel/win32yank or other depending on platform)
- A [Nerd Font](https://www.nerdfonts.com/): optional, provides various icons
  - if you have it set `vim.g.have_nerd_font` in `init.lua` to true
- Language Setup:
  - For Pyhton you need
  ```
  sudo apt install python3
  sudo apt install python3-pip -y
  ```
  - For Typescript/Javascript, you need `npm`
  ```
  sudo apt install ca-certificates curl gnupg
  curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
  echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list
  sudo apt update
  sudo apt install nodejs
  sudo apt install build-essential
  ```
  - For Golang, you will need `golang-go`
  ```
  sudo apt install golang-go
  ```

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

## Additional Infos

### Install Quemu for VMs

```
sudo apt update
sudo apt install qemu-kvm virt-manager virtinst libvirt-clients bridge-utils libvirt-daemon-system -y
sudo systemctl enable --now libvirtd
sudo systemctl start libvirtd
sudo systemctl status libvirtd
sudo usermod -aG kvm $USER
sudo usermod -aG libvirt $USER
sudo virt-manager
```
