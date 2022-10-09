Try{
git --version
    }Catch{
scoop install git
        }
Try{
emacs --version
    }Catch{
scoop install emacs
        }

Try{
git --version
    }Catch{
scoop install llvm
        }
Try{
rg --version
    }Catch{
scoop install ripgrep
        }
Try{
fd --version
    }Catch{
scoop install fd
        }

git clone --depth 1 https://github.com/doomemacs/doomemacs $home\.emacs.d
. $home/.emacs.d/bin/doom.cmd install
