winget install Neovim.Neovim

choco install fzf fd ripgrep mingw nerd-fonts-DejaVuSansMono nerd-fonts-SourceCodePro nodejs

# curl -o ~/Downloads/node-v20.9.0-x64.msi https://nodejs.org/dist/v20.9.0/node-v20.9.0-x64.msi
# msiexec /norestart /package ~/Downloads/node-v20.9.0-x64.msi /passive

git clone https://github.com/LazyVim/starter $env:LOCALAPPDATA\nvim
Remove-Item $env:LOCALAPPDATA\nvim\.git -Recurse -Force
cp -f init.lua $env:LOCALAPPDATA\nvim\init.lua
