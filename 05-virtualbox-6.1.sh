#!/bin/bash


# virtual  box 6.1
sudo apt install virtualbox-6.1

# Adicionar seu usuário no grupo vboxusers
sudo usermod -a -G vboxusers $USER

#Erro no modulo do Kernel, VirtualBox, muito comum após instalação de um kernel novo.
#*Esses comandos valem para Ubuntu, Linux Mint Debian e derivados.
#(você pode adapta-los para sua distro, procurando por esses complementos no gerenciador de pacotes padrão do seu sistema, caso seja um Fedora etc).


sudo apt-get install build-essential module-assistant

sudo m-a prepare

#*Depois compile o driver
sudo /sbin/vboxconfig
#ou 
#sudo vboxconfig 

