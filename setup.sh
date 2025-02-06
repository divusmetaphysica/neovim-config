sudo apt-get install neovim
sudo apt-get install fzf fd-find ripgrep gcc

# https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/DejaVuSansMono.zip
# https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/FiraCode.zip
# curl -O https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/SourceCodePro.zip
# && cd ~/.local/share/fonts \
# && unzip SourceCodePro.zip \
# && rm SourceCodePro.zip \
# && fc-cache -fv

git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git
cp -f init.lua ~/nvim/init.lua
