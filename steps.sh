#!/bin/bash

# Install WSL2 from Microsoft Store
echo "Installing WSL2 from Microsoft Store..."
# (You can replace this with a prompt to the user to manually install WSL2)

# Update and upgrade packages
echo "Updating and upgrading packages..."
sudo apt update && sudo apt upgrade -y

# Install essential libraries
echo "Installing essential libraries..."
sudo apt install -y software-properties-common build-essential gcc libc++-14-dev libc++abi-14-dev git tree

# Install and set up Neovim
echo "Installing and setting up Neovim..."
sudo add-apt-repository -y ppa:neovim-ppa/unstable
sudo apt update
sudo apt install -y neovim
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# Install and set up Node.js with NVM
echo "Installing and setting up Node.js..."
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
source ~/.bashrc
nvm install 16

# Install and set up Zsh with Oh My Zsh and popular plugins/themes
echo "Installing and setting up Zsh with Oh My Zsh and plugins/themes..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

# Reload Zsh configuration
echo "Reloading Zsh configuration..."
source ~/.zshrc

echo "Done!"