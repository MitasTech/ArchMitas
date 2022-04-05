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
		Installing Awesome Window Manager
"
sleep 5

cd ~
sudo pacman -Sy awesome lightdm lightdm-gtk-greeter thunar lxsession rxvt-unicode alsa-utils pulseaudio pulseaudio-alsa wireless_tools zsh dunst rofi feh i3lock-fancy lightdm-webkit2-greeter lightdm-webkit-theme-aether lxappearance pnmixer qt5ct gsimplecal xautolock xclip network-manager-applet networkmanager-openvpn materia-theme polkit-gnome scrot flameshot ttf-roboto thunar-archive-plugin thunar-volman thunar-media-tags-plugin tumbler jq w3m geany nano viewnior pavucontrol qt5-styleplugins parcellite neofetch htop picom gtk2-perl xfce4-power-manager imagemagick playerctl xsettingsd obconf

cd ~
git clone https://github.com/ChrisTitusTech/titus-awesome ~/.config/awesome

systemctl enable lightdm

echo -ne "
---------------------------------------------------------------------------------------------------------------------------------
 ██████╗  █████╗ ███╗   ███╗██╗ █████╗ ██████╗ ██╗    ██████╗  ██████╗ ██╗   ██╗████████╗ █████╗ ███╗   ██╗██╗ █████╗ ██████╗ ██╗
██╔════╝ ██╔══██╗████╗ ████║██║██╔══██╗██╔══██╗██║    ██╔══██╗██╔═══██╗██║   ██║╚══██╔══╝██╔══██╗████╗  ██║██║██╔══██╗██╔══██╗██║
██║  ███╗███████║██╔████╔██║██║███████║██████╔╝██║    ██████╔╝██║   ██║██║   ██║   ██║   ███████║██╔██╗ ██║██║███████║██████╔╝██║
██║   ██║██╔══██║██║╚██╔╝██║██║██╔══██║██╔══██╗██║    ██╔═══╝ ██║   ██║██║   ██║   ██║   ██╔══██║██║╚██╗██║██║██╔══██║██╔══██╗██║
╚██████╔╝██║  ██║██║ ╚═╝ ██║██║██║  ██║██║  ██║██║    ██║     ╚██████╔╝╚██████╔╝   ██║   ██║  ██║██║ ╚████║██║██║  ██║██║  ██║██║
 ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝    ╚═╝      ╚═════╝  ╚═════╝    ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝                                                                                                                                 
---------------------------------------------------------------------------------------------------------------------------------
                    				Automated Awesome Window Manager Configuration
                        			    	   SCRIPTHOME: ArchMitas
---------------------------------------------------------------------------------------------------------------------------------
							Installed Awesome Window Manager
"

