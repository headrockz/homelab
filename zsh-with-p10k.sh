#!usr/bin/env bash
######################## Installation script ########################

# Shell -> zsh 
# plugins -> powerlevel10k zsh-autosuggstions fast-syntax-highlighting zsh-completions

####################################################################

sudo apt install zsh git -y && echo "ZSH successfully installed"

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.zsh/powerlevel10k
git clone https://github.com/zsh-users/zsh-completions ~/.zsh/zsh-completions
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting ~/.zsh/fast-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

# My dotfiles
git clone https://github.com/headrockz/.mydotfliles.git

mv .mydotfliles/.zshrc ~/
mv .mydotfliles/.p10k.zsh ~/

# Definindo o zsh com shell padrao
sudo usermod --shell $(which zsh) $USER
