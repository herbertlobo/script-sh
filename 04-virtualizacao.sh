#!/usr/bin/env bash

#Para usar o KVM e QEMU nesses sistemas você precisará instalar os seguintes pacotes:

#qemu-kvm - software que fornece emulação de hardware para o KVM.
#libvirt-daemon-system - arquivos de configuração para executar o daemon libvirt como um serviço do sistema.
#libvirt-clients - software para gerenciar plataformas de virtualização, antigamente instalável pelo pacote libvirt-bin que teve seu nome alterado.
#bridge-utils - um conjunto de ferramentas de linha de comando para configurar Ethernet.
#virtinst - um conjunto de ferramentas de linha de comando para a criação de máquinas virtuais.
#virt-manager - uma interface GUI fácil de usar e utilitários de linha de comando de suporte para gerenciar máquinas virtuais por meio de libvirt.


sudo apt install qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils virtinst virt-manager

# o daemon libvirt será iniciado automaticamente.
sudo systemctl is-active libvirtd

#Para você conseguir criar “máquinas virtuais”, 
#certifique-se de incluir seu usuário aos grupos: kvm e libvirt da seguinte forma:
sudo usermod -aG libvirt $USER
sudo usermod -aG kvm $USER

echo " Pronto.."

#Criando uma VM via linha de comando

#Para o exemplo do Gparted usei esse comando:
#1º primeiramente crie a máquina vitual
# qemu-img create -f qcow2 gparted.img 10G
#2º em seguida, abra indicando o caminho do .iso
# qemu-system-x86_64 -m 1024 -boot d -enable-kvm -smp 3 -net nic -net user -hda gparted.img -cdrom gparted-live-1.1.0-1-amd64.iso

#Explicação dos parâmetros Vamos explicar o comando anterior parte por parte:

# -m 1024: Aqui escolhemos a quantidade de RAM que desejamos fornecer para o QEMU ao executar o arquivo ISO. Escolhemos 1024 MB aqui. Você pode alterá-lo se quiser de acordo com suas necessidades.
# -boot -d: A opção de inicialização nos permite especificar a ordem de inicialização, qual dispositivo deve ser inicializado primeiro? -d significa que o CD-ROM será o primeiro, então o QEMU inicializará normalmente na imagem do disco rígido. Usamos a opção -cdrom como você pode ver no final do comando. Você pode usar -c se quiser inicializar a imagem do disco rígido primeiro.
# -enable-kvm: Esta é uma opção muito importante. Ele nos permite usar a tecnologia KVM para emular a arquitetura que desejamos. Sem ele, o QEMU usará a renderização por software, que é muito lenta. É por isso que devemos usar esta opção, apenas certifique-se de que as opções de virtualização estão habilitadas no BIOS do seu computador.
# -smp 3: Se quisermos usar mais de 1 núcleo para o sistema operacional emulado, podemos usar esta opção. Optamos por usar 3 núcleos para executar a imagem virtual, o que a tornará mais rápida. Você deve alterar este número de acordo com a CPU do seu computador.
# -net nic -net user: Ao usar essas opções, vamos permitir que uma conexão Ethernet com a Internet esteja disponível na máquina virtual em execução por padrão.
# -hda gparted.img: aqui especificamos o caminho para o disco rígido que será usado. No nosso caso, foi o arquivo gparted.img que criamos antes.
# -cdrom gparted-live-1.1.0-1-amd64.iso: Finalmente, dissemos ao QEMU que desejamos inicializar nosso arquivo ISO “gparted-live-1.1.0-1-amd64.iso”.

#concluiu a instalação e agora deseja sempre inicializar o sistema instalado), pode apenas remover a opção -cdrom:
#qemu-system-x86_64 -m 1024 -boot d -enable-kvm -smp 3 -net nic -net user -hda gparted-live-1.1.0-1-amd64.iso

#Observe que, neste tutorial, usamos a arquitetura x86_64 para executar o QEMU. Se desejar, você pode escolher entre várias outras arquiteturas disponíveis para testar seus sistemas:

#ls /usr/bin | grep qemu-system*
#qemu-system-x86_64

#No meu caso, somente x86_64 mesmo.

#Se quiser usar o QEMU para inicializar de um CD / DVD inserido na unidade de disco, você pode fazer facilmente:

#qemu-system-x86_64 -m 1024 -boot d -enable-kvm -smp 3 -net nic -net user -hda from-my-cdrom-drive.img -cdrom /dev/cdrom
