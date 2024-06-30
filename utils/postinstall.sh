#!/usr/bin/env bash
# ----------------------------------------------------------------- #
# Linguagens -> C#, Python
# Ferramentas -> Docker, Docker compose, Openssh, git
# Devops -> azure-cli
# Shell -> zsh
# Plugins -> powerlevel10k zsh-autosuggstions
#            fast-syntax-highlighting zsh-completions
# ----------------------------------------------------------------- #

################# Removendo travas eventuais do apt #################
sudo rm /var/lib/dpkg/lock-frontend
sudo rm /var/cache/apt/archives/lock

##################### Atualizando o ambiente ########################
sudo apt update -y && sudo apt dist-upgrade -y ;

# -------------- INSTALAÇÃO DE ALGUMAS FERRAMENTAS ---------------- #

############### Instalando o git e outras ferramentas ###############
sudo apt install git curl build-essential gcc ca-certificates gnupg \
  lsb-release openssh-client openssh-server apt-transport-https zsh -y ;

# ------------------ MINHAS FERRAMENTAS - DEV --------------------- #

######################## instalando o pyenv #########################
git clone https://github.com/pyenv/pyenv.git $HOME/.pyenv ;

############################## Poetry ###############################
curl -sSL https://install.python-poetry.org | python3 -

##################### docker e sdk do .net core #####################
# Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg &&
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null ;

# .net core
wget https://packages.microsoft.com/config/ubuntu/21.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb &&
sudo dpkg -i packages-microsoft-prod.deb &&
rm packages-microsoft-prod.deb ;

# ------------------ MINHAS FERRAMENTAS - DEVOPS ------------------ #

############################## Azure ################################
# curl -sL https://packages.microsoft.com/keys/microsoft.asc |
#     gpg --dearmor |
#     sudo tee /etc/apt/trusted.gpg.d/microsoft.gpg > /dev/null
# curl -sL https://packages.microsoft.com/keys/microsoft.asc |
#     gpg --dearmor |
#     sudo tee /etc/apt/trusted.gpg.d/microsoft.gpg > /dev/null


# ----------------- INSTALAÇÃO DAS FERRAMENTAS -------------------- #

####################### Atualizando os pacotes ######################
sudo apt update ;

######### Instalando o docker e sdk do .net core ##########
sudo apt install docker-ce docker-ce-cli containerd.io \
  dotnet-sdk-6.0 webmin -y &&

# adicionando nosso usuario ao grupo do docker
sudo usermod -aG docker $USER ;

################### Instalando a Azure, GCP AWS #####################
# sudo apt-get install azure-cli -y ;

# ------------------ INSTALAÇÃO DOCKER COMPOSE -------------------- #

#################### Instalando o Docker Compose ####################
sudo curl -L \
  "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" \
  -o /usr/local/bin/docker-compose \
&& sudo chmod +x /usr/local/bin/docker-compose ;

# -------------------- INSTALAÇÃO DOS DOTFILES -------------------- #

###################### Powerlevel10k e plugins ####################
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $HOME/.zsh/powerlevel10k &&
git clone https://github.com/zsh-users/zsh-completions $HOME/.zsh/zsh-completions &&
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting $HOME/.zsh/fast-syntax-highlighting &&
git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.zsh/zsh-autosuggestions &&

############################ My dotfiles ############################
git clone https://github.com/headrockz/.mydotfliles.git $HOME/ &&

mv .mydotfliles/.zshrc $HOME/ &&
mv .mydotfliles/.p10k.zsh $HOME/ &&

################## Definindo o zsh com shell padrao #################
sudo usermod --shell $(which zsh) $USER ;

# ----------------------- PÓS-INSTALAÇÃO -------------------------- #

####################### Finalizando e limpando ######################
sudo apt update && sudo apt dist-upgrade -y ;
sudo apt autoclean ;
sudo apt autoremove -y

# ------------------- ACABOU - VOLTE SEMPRE ----------------------- #
