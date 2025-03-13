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
- Fonte utilizada: `UbuntuMono Nerd Font Mono`

---

## Neovim
- Configuração baseada no repositório [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim).
- Aprenda mais sobre [Vim Motions](https://www.barbarianmeetscoding.com/boost-your-coding-fu-with-vscode-and-vim/moving-blazingly-fast-with-the-core-vim-motions/).

---

## Rofi
- Configuração baseada no repositório [rofi-collection](https://github.com/Murzchnvok/rofi-collection) tokyonight. 


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
- `nvm`
- `docker`
- `docker-compose`
- `nvim`

---

## Ambiente Desktop

### Compositor Wayland dinâmico (Tiling Window Manager)
- `hyprland`

### Emulador de terminal
- `kitty`

### AUR Helper
- `yay`

### Fonte para o Powerlevel10k
- `ttf-meslo-nerd-font-powerlevel10k`

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

### Lançador de aplicativos
- `wofi`

### Navegador
- `firefox`


