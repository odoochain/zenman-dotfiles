git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.emacs.d
cd ~/.emacs.d/bin
./doom install
echo "PATH=$PATH:~/.emacs.d/bin" >> ~/.zshrc
./doom sync
