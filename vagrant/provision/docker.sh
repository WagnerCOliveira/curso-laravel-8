#!/bin/bash

echo "################ Removendo Pacotes Desnecessarios #####################"
sudo apt-get remove docker docker-engine docker.io containerd runc -y

echo "####################### Atualizando Sistema ###########################"
sudo apt-get update

echo "#################### Instalando Pre-requisitos ########################"
sudo apt-get install ca-certificates curl gnupg lsb-release git vim -y

echo "################  Adicionando Repositorios Dokcer CE ##################"
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "###################### Instalando Docker CE ###########################"
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io -y

echo "################ Aplicando permissões ao usuário $USER ###############"
sudo usermod -aG docker vagrant

echo "##################### Instalando docker compose #######################"
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
docker-compose --version


exit 0
