#!/usr/bin/env bash

# copiar .config files
echo -e "\nCopiando arquivo de configuração...."
cp -R config "$HOME/.config"
cp home/gtktc-2.0 "$HOME/.gtk-2.0"
cp home/fehbg "$HOME/.fenbg"
cp home/bash_profiler "$HOME/.bash_profiler"

# user dirs
echo -e "Criando pastas de Usuario..."
mkdir "$HOME/Desktop"
mkdir "$HOME/Documentos"
mkdir "$HOME/Dowloads"
mkdir "$HOME/Music"
mkdir "$HOME/Videos"
mkdir "$HOME/Imagen"
mkdir "$HOME/Publico"
mkdir "$HOME/Templates"

# Criar Arquivo  user-dirs.dirs na pasta $HOME/.config
#
#XDG_DESKTOP_DIR="$HOME/Desktop"
#XDG_DOCUMENTS_DIR="$HOME/Documentos"
#XDG_DOWNLOAD_DIR="$HOME/Downloads"
#XDG_MUSIC_DIR="$HOME/Music"
#XDG_PICTURES_DIR="$HOME/Imagen"
#XDG_PUBLICSHARE_DIR="$HOME/Publico"
#XDG_TEMPLATES_DIR="$HOME/Templates"
#XDG_VIDEOS_DIR="$HOME/Videos"

# create ~/.local dirs
echo -e "Criando pasta ~/.local..."
mkdir -p "$HOME/.local/opt"
mkdir -p "$HOME/.local/share"

# copy script to ~/.local/bin
echo -e "Copiando scripts..."
cp -R "$HOME/.local/"
cp -R art
