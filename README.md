# Dotfiles

## Instalação
Para utilizar essas configurações, faça o symlink das pastas.

⚠️ **Lembre-se de verificar a documentação dos pacotes e do Arch Linux!** ⚠️

---

## Kitty
Se estiver no Ubuntu:
- Use **Blur My Shell** para aplicar desfoque ao Kitty.
- Use **Hide Top Bar** para esconder a barra superior.
- Configure o terminal padrão com:
  ```sh
  gsettings set org.gnome.desktop.default-applications.terminal exec 'kitty'
  ```
- Fonte utilizada: `Noto Sans Mono`

---

## Neovim
- Configuração baseada no repositório [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim).
- Aprenda mais sobre [Vim Motions](https://www.barbarianmeetscoding.com/boost-your-coding-fu-with-vscode-and-vim/moving-blazingly-fast-with-the-core-vim-motions/).

---

# Arch Linux

## Sistema
- **Ferramenta de particionamento**: `cfdisk`
- **Pacotes base:**
  ```sh
  pacstrap -K /mnt base linux linux-firmware sof-firmware base-devel grub efibootmgr vim networkmanager {cpu}-ucode
  ```

## Usuários
- Criar usuário e adicioná-lo ao grupo `wheel`:
  ```sh
  useradd -m -G wheel -s /bin/bash {username}
  ```
- Habilitar o grupo `wheel` para executar qualquer comando:
  ```sh
  EDITOR=vim visudo
  ```
- Habilitar o serviço de rede:
  ```sh
  systemctl enable NetworkManager
  ```

## Bootloader
- Instalar o GRUB:
  ```sh
  grub-install /dev/sda
  ```
- Gerar a configuração do GRUB:
  ```sh
  grub-mkconfig -o /boot/grub/grub.cfg
  ```

---

## Ferramentas
- `git`

### Gerador de diretórios
- `xdg-user-dirs`

### Ferramentas de desenvolvimento
- `zsh`
- `oh-my-zsh` (Plugins: `git`, `poetry`, `zsh-syntax-highlighting`, `zsh-autosuggestions`)
- `fastfetch`
- `openssh`
- `powerlevel10k`
- `pyenv`
- `fnm`
- `docker`
- `docker-compose`
- `unzip`
- `nvim`
- `ripgrep`
- `lazygit`
- `python-pipx`

#### Fonte para o Powerlevel10k
- `noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra`
- `nerd-fonts` ttf-noto-nerd

---

## Ambiente Desktop

### Compositor Wayland dinâmico (Tiling Window Manager)
- `hyprland`

### Emulador de terminal
- `kitty`

### AUR Helper
- `yay`


### Gerenciador de session
- `greetd`
- `greetd-tuigreet`

### Configurações essenciais para o Hyprland ⚠️ **Verifique a documentação!** ⚠️
- `swaync`
- `pipewire`
- `wiredplumber`
- `xdg-desktop-portal-hyprland`
- `hyprpolkitagent`
- `qt5-wayland`
- `qt6-wayland`
- `xdg-desktop-portal-gtk`

### Xorg apps
- `xorg-xwayland`
- Sometimes making GDK_BACKEND=x11 in env for app solves the problem

### Clipboard
- `cliphist`

### Lançador de aplicativos
- `rofi-wayland`
- `sudo ln -sf /usr/bin/kitty /usr/bin/xterm` Faz os arquivos .desktop acharem que o kitty é o terminal=true  
- `papirus-icon-theme`

### Audio
- `pipewire-pulse`
- `pavucontrol`

### Wallpaper
- `hyprpaper`

### File manager
- `thunar`
- `gvfs`
- `viewnior` image GUI viewer
#### Terminal
- `lf`
- `yay ctpv-git`
- `vlc`
- `poppler`
- `ffmpegthumbnailer`
- `fzf` and ripgrep if not installed

### Tema 
#### GTK
- `nwg-look`
- `Arc-Dark`
#### QT
- `QGtk3Style`

### Status Bar [SimpleBlueColorWaybar](https://github.com/d00m1k/SimpleBlueColorWaybar). 
- `waybar` hyprland module
- `otf-font-awesome`
- `network-manager-applet`
- `xbindkeys`
- `power-profiles-daemon`

### Screenshot
- `grim` FAQ hyprland
- `slurp`

### Lock Screen
- `hyprlock`

### Idle
- `hypridle`
- `brightnessctl`

### Bluetooth
- `bluez`
- `bluez-utils`
- `bluetui`

### System Monitoring
- `htop`
