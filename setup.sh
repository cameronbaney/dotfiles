# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Install the Powerlevel10k theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
ln -sf ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k/powerlevel10k.zsh-theme ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k.zsh-theme


# Add the preferred Powerlevel10k configuration
cp ~/dotfiles/.p10k.zsh ~/.p10k.zsh

# Install Oh My Zsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Remove old configuration
mv ~/.zshrc ~/.zshrc.old

# Link Zsh config
ln -sf ~/dotfiles/.zshrc ~/.zshrc

# Reload zsh config
source ~/.zshrc

if [[ "$SPIN" = 1 ]]
then
  # Only run nested steps in Spin + shopify/shopify workspaces.
  if [[ "$SPIN_REPO_SOURCE_PATH" = "/src/github.com/shopify/shopify" ]]
  then
    cd "$SPIN_REPO_SOURCE_PATH"
    # This will always be the author of the cartridge, so for the shopify-reportify-config it will be shameelabd (do not modify this)
    # Do **NOT** replace this username with your username.
    cartridge insert shameelabd/shopify-reportify-config
    . /cartridges/shopify-reportify-config/setup.sh

    restart
  fi
fi