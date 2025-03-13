# dotfiles
Symlink the folders into ~/.config  
!!! REMEMBER TO CHECK THE DOC FROM THE PACKAGES AND ARCH !!!  

## Kitty
If on ubuntu use blur my shell to blur kitty  
If on ubuntu use hide top bar to hide the top bar  
If on ubuntu use command gsettings set org.gnome.desktop.default-applications.terminal exec 'kitty'  
The font is UbuntuMono Nerd Font Mono

## Nvim
Nvim config based on the kickstart.nvim repository https://github.com/nvim-lua/kickstart.nvim  
Learn [Vim Motions](https://www.barbarianmeetscoding.com/boost-your-coding-fu-with-vscode-and-vim/moving-blazingly-fast-with-the-core-vim-motions/)  


# Arch
## System  
Partition tool: cfdisk  
Base packages: base linux linux-firmware sof-firmware base-devel grub efibootmgr vim networkmanager {cpu}-ucode  
## Users  
Create user and add it in the wheel group: useradd -m -G wheel -s /bin/bash {usenarme}  
Enable wheel group to execute any command: EDITOR=vim visudo  
## Starting packages  
Network: systemctl enable NetworkManager  
## Bootloader  
Grub: grub-install /dev/sda  
Config grub: grub-mkconfig -o /boot/grub/grub.cfg
## Tools  
git  
xdg-user-dirs  
zsh  
ohmyzsh - plugins=(git poetry zsh-syntax-highlighting zsh-autosuggestions)  
fastfetch  
openssh  
yay  
powerlevel10k  
pyenv  
nvm  
docker  
docker-compose  
## Desktop enviroment
hyprland  
kitty  
ttf-meslo-nerd-font-powerlevel10k  
greetd  
greetd-tuigreet  
-- Musts from Hyprland
swaync  
pipewire  
wiredplumber  
xdg-desktop-portal-hyprland  

