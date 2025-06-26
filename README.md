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
- **[Btrfs](https://gist.github.com/mjkstra/96ce7a5689d753e7a6bdd92cdc169bae)**  
  `mkfs.btrfs /dev/{root_partition}`  
  `mount /dev/{root_partition} /mnt`  
  `btrfs subvolume create /mnt/@`  
  `btrfs subvolume create /mnt/@home`  
  `umount /mnt`  
  `mount -o subvol=@ /dev/{root_partition} /mnt`  
  `mkdir -p /mnt/home`  
  `mount -o subvol=@home /dev/{root_partition} /mnt/home`
  `mount /dev/{efi_partition} /mnt/efi`
  - Automaticamente adicionar no GRUB quando tirar um snapshot:
    `sudo systemctl edit --full grub-btrfsd` setar para o timeshift.
    `sudo systemctl enable grub-btrfsd`
  
- **Pacotes base:**
  ```bash
  # base: Pacotes essenciais para inicializar o sistema Arch Linux.
  # linux: Kernel padrão do Arch Linux. Use 'linux-lts' se preferir uma versão mais estável.
  # linux-firmware: Firmwares de hardware para vários dispositivos, como Wi-Fi, Bluetooth etc.
  # sof-firmware: Firmware para dispositivos de áudio suportados pelo Sound Open Firmware.
  # base-devel: Conjunto de ferramentas de desenvolvimento base, como make e gcc.
  # grub: Bootloader necessário para inicializar o sistema operacional.
  # efibootmgr: Utilitário necessário para configurar o GRUB em sistemas EFI.
  # grub-btrfs: Suporte a snapshots BTRFS no GRUB, permitindo inicializar diretamente de snapshots.
  # btrfs-progs: Utilitários para gerenciar sistemas de arquivos BTRFS no espaço do usuário.
  # inotify-tools: Utilitários que monitoram eventos de sistema de arquivos, usados pelo grub-btrfsd.
  # timeshift: Ferramenta gráfica para criar, agendar e restaurar snapshots BTRFS.
  # vim: Editor de texto. Caso não esteja familiarizado, use o nano.
  # networkmanager: Gerenciador de conexões de rede com suporte para conexões cabeadas e Wi-Fi.
  # {cpu}-ucode: Atualizações de microcódigo para a CPU. Use 'amd-ucode' para AMD ou 'intel-ucode' para Intel.
  ```
  ```sh
  pacstrap -K /mnt base linux linux-firmware sof-firmware base-devel grub efibootmgr grub-btrfs btrfs-progs inotify-tools timeshift vim networkmanager {cpu}-ucode
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
- `wget`
- `luarocks`
- `python-pipx`

#### Fontes
- `noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra`
- `nerd-fonts` ttf-noto-nerd

---

## Ambiente Desktop

### Compositor Wayland dinâmico (Tiling Window Manager)
- `hyprland`


### Session Manager
- `uwsm`
#### After installing dependencies:
- `systemctl --user enable --now hyprpaper.service`
- `systemctl --user enable --now hypridle.service`
- `systemctl --user enable --now waybar.service`
- `systemctl --user enable --now hyprpolkitagent.service`


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
- `wireplumber`
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
- `yazi`
- [Tokyonight Theme](https://github.com/BennyOe/tokyo-night.yazi)

### Tema 
#### GTK
- `nwg-look`
- [Tokyonight-GTK-Theme-Dark](https://github.com/Fausto-Korpsvart/Tokyonight-GTK-Theme) 
#### QT
- `QT_QPA_PLATFORMTHEME=gtk3` 

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
- `btop`

### Output Management
- `nwg-displays`
