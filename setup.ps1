winget install Neovim.Neovim

choco install fzf fd ripgrep mingw nerd-fonts-DejaVuSansMono nerd-fonts-SourceCodePro

git clone https://github.com/LazyVim/starter $env:LOCALAPPDATA\nvim
Remove-Item $env:LOCALAPPDATA\nvim\.git -Recurse -Force

cp -f init.lua $env:LOCALAPPDATA\nvim\init.lua