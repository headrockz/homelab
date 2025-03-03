#!/usr/bin/env bash
# ----------------------------------------------------------------- #
# Linguagens ->  Python
# Ferramentas -> Docker, kubectl, k9s
# Shell -> zsh
# Plugins -> powerlevel10k zsh-autosuggstions
#            fast-syntax-highlighting zsh-completions
# ----------------------------------------------------------------- #

########################### Minhas variaveis ########################
export ARCH=$(dpkg --print-architecture) ;

################# Removendo travas eventuais do apt #################
sudo rm /var/lib/dpkg/lock-frontend
sudo rm /var/cache/apt/archives/lock

##################### Atualizando o ambiente ########################
sudo apt update -y && sudo apt dist-upgrade -y ;

# -------------- INSTALAÇÃO DE ALGUMAS FERRAMENTAS ---------------- #

############### Instalando o git e outras ferramentas ###############
sudo apt install -y git curl build-essential gcc ca-certificates \
    gnupg lsb-release make libssl-dev zlib1g-dev libbz2-dev tk-dev \
    libreadline-dev libsqlite3-dev libncurses5-dev libncursesw5-dev \
    xz-utils  libffi-dev liblzma-dev ;

# ------------------ MINHAS FERRAMENTAS - DEV --------------------- #

######################## instalando o pyenv #########################
curl https://pyenv.run | bash ;

############################## Poetry ###############################
curl -sSL https://install.python-poetry.org | python3 -

############################ Docker #################################
  sudo bash
# Adicionando nosso usuario ao grupo do docker
sudo usermod -aG docker $USER ;

########################### Kubectl #################################
export KUBECTL_VERSION=$(curl -L -s https://dl.k8s.io/release/stable.txt) ;

curl -LO "https://dl.k8s.io/release/$(KUBECTL_VERSION)/bin/linux/$(ARCH)/kubectl" ;
chmod +x kubectl ;
sudo mv kubectl /usr/local/bin ;


############################# Helm ##################################
curl https://baltocdn.com/helm/signing.asc | \
    gpg --dearmor | \
    sudo tee /usr/share/keyrings/helm.gpg > /dev/null
echo "deb [arch=$(ARCH) signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main" | \
sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
sudo apt-get update
sudo apt-get install helm

# -------------------- INSTALAÇÃO DOS DOTFILES -------------------- #

###################### Powerlevel10k e plugins ####################
git clone https://github.com/zsh-users/zsh-completions $HOME/.zsh/zsh-completions &&
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting $HOME/.zsh/fast-syntax-highlighting &&
git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.zsh/zsh-autosuggestions &&

############################ My dotfiles ############################
git clone https://github.com/headrockz/mydotfliles.git &&

mv .mydotfliles/.zshrc $HOME/ &&

################## Definindo o zsh com shell padrao #################
sudo usermod --shell $(which zsh) $USER ;

# ----------------------- PÓS-INSTALAÇÃO -------------------------- #

####################### Finalizando e limpando ######################
sudo apt update && sudo apt dist-upgrade -y ;
sudo apt autoclean ;
sudo apt autoremove -y

echo "Lembre-se de instalar o k9s"
# ------------------- ACABOU - VOLTE SEMPRE ----------------------- #
