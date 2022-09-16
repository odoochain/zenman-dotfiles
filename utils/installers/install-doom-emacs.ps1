Try{
git --version
    }Catch{
scoop install git
        }
Try{
git --version
    }Catch{
scoop install git
        }

Try{
git --version
    }Catch{
scoop install llvm
        }
Try{
git --version
    }Catch{
scoop install ripgrep
        }
Try{
git --version
    }Catch{
scoop install fd
        }
Try{
git --version
    }Catch{
scoop install emacs
        }

# Doesn't work in windows powershell
#    cd $home
#    git clone --depth 1 https://github.com/doomemacs/doomemacs .emacs.d
#    ~/.emacs.d/bin/doom install
