#!/usr/bin/env bash
#github-action genshdoc
echo -ne "
-------------------------------------------------------------------------
   █████╗ ██████╗  ██████╗██╗  ██╗    ███╗   ███╗██╗████████╗ █████╗ ███████╗
  ██╔══██╗██╔══██╗██╔════╝██║  ██║    ████╗ ████║██║╚══██╔══╝██╔══██╗██╔════╝
  ███████║██████╔╝██║     ███████║    ██╔████╔██║██║   ██║   ███████║███████╗
  ██╔══██║██╔══██╗██║     ██╔══██║    ██║╚██╔╝██║██║   ██║   ██╔══██║╚════██║
  ██║  ██║██║  ██║╚██████╗██║  ██║    ██║ ╚═╝ ██║██║   ██║   ██║  ██║███████║
  ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝    ╚═╝     ╚═╝╚═╝   ╚═╝   ╚═╝  ╚═╝╚══════╝
-------------------------------------------------------------------------
                    Automated Arch Linux Installer
                        SCRIPTHOME: ArchMitas
-------------------------------------------------------------------------

Installing AUR Softwares
"
source $HOME/ArchMitas/configs/setup.conf

  cd ~
  mkdir "/home/$USERNAME/.cache"
  touch "/home/$USERNAME/.cache/zshhistory"
  git clone "https://github.com/ChrisTitusTech/zsh"
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
  ln -s "~/zsh/.zshrc" ~/.zshrc
  git clone "https://github.com/MitasTech/BootloaderThemes"

sed -n '/'$INSTALL_TYPE'/q;p' ~/ArchMitas/pkg-files/${DESKTOP_ENV}.txt | while read line
do
  if [[ ${line} == '--END OF MINIMAL INSTALL--' ]]
  then
    # If selected installation type is FULL, skip the --END OF THE MINIMAL INSTALLATION-- line
    continue
  fi
  echo "INSTALLING: ${line}"
  sudo pacman -S --noconfirm --needed ${line}
done


if [[ ! $AUR_HELPER == none ]]; then
  cd ~
  git clone "https://aur.archlinux.org/$AUR_HELPER.git"
  cd ~/$AUR_HELPER
  makepkg -si --noconfirm
  # sed $INSTALL_TYPE is using install type to check for MINIMAL installation, if it's true, stop
  # stop the script and move on, not installing any more packages below that line
  sed -n '/'$INSTALL_TYPE'/q;p' ~/ArchMitas/pkg-files/aur-pkgs.txt | while read line
  do
    if [[ ${line} == '--END OF MINIMAL INSTALL--' ]]; then
      # If selected installation type is FULL, skip the --END OF THE MINIMAL INSTALLATION-- line
      continue
    fi
    echo "INSTALLING: ${line}"
    $AUR_HELPER -S --noconfirm --needed ${line}
  done
fi

export PATH=$PATH:~/.local/bin

# Theming DE if user chose FULL installation
if [[ $INSTALL_TYPE == "FULL" ]]; then
  if [[ $DESKTOP_ENV == "kde" ]]; then
    cp -r ~/ArchMitas/configs/.config/* ~/.config/
    pip install konsave
    konsave -i ~/ArchMitas/configs/kde.knsv
    sleep 1
    konsave -a kde
  elif [[ $DESKTOP_ENV == "openbox" ]]; then
    cd ~
    git clone https://github.com/stojshic/dotfiles-openbox
    ./dotfiles-openbox/install-titus.sh
  fi
fi

# Theming DE if user chose FULL Gnome installation
if [[ $INSTALL_TYPE == "FULL" ]]; then
  if [[ $DESKTOP_ENV == "gnome" ]]; then
    cp -r ~/ArchMitas/configs/.config/* ~/.config/
    cd ~
    cp -r ~/ArchMitas/configs/full-backup/* ~/.config/
    sleep 1
    cd ~
    cd ~/ArchMitas/configs/
    dconf load / < full-backup
  fi
fi
cd ~
git clone https://aur.archlinux.org/chrome-gnome-shell.git
cd chrome-gnome-shell
makepkg -si

cd ~
sudo pacman -S sassc
sleep 2
git clone https://github.com/ewlsh/dash-to-dock
cd dash-to-dock
git checkout ewlsh/gnome-40
make
sleep 1
make install
sleep 1
cd ~
echo -ne "
-------------------------------------------------------------------------
                    SYSTEM READY FOR 3-post-setup.sh
-------------------------------------------------------------------------
"
exit
