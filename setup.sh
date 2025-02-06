NODE_VERSION = '20.9.0'
sudo apt-get install neovim
sudo apt-get install fzf fd-find ripgrep gcc

pushd /opt/
sudo curl -o /opt/node-v$NODE_VERSION-linux-x64.tar https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.xz
sudo ln -s /opt/node-v$NODE_VERSION-linux-x64/bin/node /usr/local/bin/node
sudo ln -s /opt/node-v$NODE_VERSION-linux-x64/bin/npx /usr/local/bin/npx
popd

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
