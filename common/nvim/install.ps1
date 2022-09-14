# Clone the git to the .vim directory of home
git clone https://github.com/mino29/meovim.git "$env:LOCALAPPDATA\nvim"

# install plugins in vim with Vundle
echo "Installing plugins via Packer"
nvim +PackerSync +qa!

# Give feedback that we installed the ultimate vimrc
echo "Meovim Installed, meow~"

cd $env:LOCALAPPDATA\nvim\neovim-context-menu
echo "if you want to use neovim everywhere"

