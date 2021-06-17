#!/bin/bash

# Update repositories and upgrade packages
printf "\nEtapa 1/8: Atualizando o sistema... \n"
sudo zypper ref && sudo zypper dup

# Install codecs from Packman repositories
printf "\nEtapa 2/8: Instalando codecs de áudio e vídeo... \n"
sudo zypper addrepo -cfp 90 'https://ftp.gwdg.de/pub/linux/misc/packman/suse/openSUSE_Tumbleweed/' packman
sudo zypper ref
sudo zypper dup --from packman --allow-vendor-change
sudo zypper install --from packman ffmpeg gstreamer-plugins-{good,bad,ugly,libav} libavcodec-full vlc-codecs

# Install NVIDIA driver from NVIDIA repositories
printf "\nEtapa 3/8: Instalando o driver proprietário NVIDIA... \n"
sudo zypper addrepo --refresh https://download.nvidia.com/opensuse/tumbleweed NVIDIA
sudo zypper ref && sudo zypper install x11-video-nvidiaG05

# Install game packages
printf "\nEtapa 4/8: Instalando pacotes de jogos... \n"
sudo zypper install wine-staging lutris steam discord obs-studio

# Install TrueType Fonts Microsoft
printf "\nEtapa 5/8: Instalando fontes TrueType da Microsoft... \n"
sudo zypper install fetchmsttfonts

# Install common software
printf "\nEtapa 6/8: Instalando softwares diversos... \n"
sudo zypper install k{get,rita,colorchooser,denlive} p{7zip-full,artitionmanager} unrar inkscape telegram-desktop qbittorrent neofetch ristretto feh youtube-dl sweeper vokoscreenNG

# Add Emulators repository and install PCSX2
printf "\nEtapa 7/8: Adicionando repositório de emuladores e instalando PCSX2... \n"
sudo zypper addrepo http://download.opensuse.org/repositories/Emulators/openSUSE_Tumbleweed/Emulators.repo
sudo zypper ref && sudo zypper install pcsx2

# Change the hostname
printf "\nEtapa 8/8: Alterando o hostname para @opensuse-desktop... \n"
sudo hostnamectl set-hostname opensuse-desktop

# End of the script.
printf "\nFIM DO SCRIPT \n\n"
