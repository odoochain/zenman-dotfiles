# zsh-related

REMOTE=https://gitee.com/mirrors/oh-my-zsh.git sh -c "$(wget https://gitee.com/mirrors/oh-my-zsh/raw/master/tools/install.sh -O -)"
git clone --depth=1 https://gitee.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc

zsh

git clone https://gitee.com/githubClone/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://gitee.com/lightnear/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

# more zsh
# cp ./zsh/.zshrc ~/.zshrc

