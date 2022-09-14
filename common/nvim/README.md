# neovim_config

## Intro

After limited testing on my part, meovim now works across different oses.
I tested on win10, win11, wsl2(ubuntu) ,wsl2(arch), arch(gnome), fedora

Haven't test mac myself, but it should work just like linux.


## Features

**Lightweight**

After install all the plugins, it takes about 800 MB(My vscode took about 2G)
With all the lsp stuff, it consumes about 1G of ram.
Less than 1 second to open up.
(I know it's not the 100KB mark you have in mind, but with all the modern
convenience it has, I think it's totally worth it.)

**Feature rich**

Auto-complete
Auto-format
Auto-update
Auto-manage plugins
Intuitive ui
100% customizable
About 100 colorschemes to choose out of the box
(Dracula, Nord, Solarized, OneDark etc.)

**Free**

Well, it's free and free.

## Structure

I finally modulized meovim config, the directory tree is as follows:

```
├── LICENSE
├── README.md
├── coc-settings.json
├── ginit.vim
├── init.lua
├── install.ps1
├── install.sh
├── lua
│   └── user
│       ├── airline.lua
│       ├── alpha.lua
│       ├── autocomands.lua
│       ├── autopairs.lua
│       ├── bufferline.lua
│       ├── cmp.lua
│       ├── cocnvim.lua
│       ├── colorschemes.lua
│       ├── comment.lua
│       ├── gitsigns.lua
│       ├── impatient.lua
│       ├── indentline.lua
│       ├── keymaps.lua
│       ├── linux.lua
│       ├── lualine.lua
│       ├── mac.lua
│       ├── nvim-tree.lua
│       ├── options.lua
│       ├── plugins.lua
│       ├── project.lua
│       ├── statusline.lua
│       ├── surround.lua
│       ├── telescope.lua
│       ├── toggleterm.lua
│       ├── treesitter.lua
│       ├── whichkey.lua
│       └── windows.lua
├── neovim-context-menu
│   ├── install-context.reg
│   └── uninstall-context.reg
└── plugin
    └── packer_compiled.lua
```

This structure and most of the configs are from the ever so popular ultiamte vimrc and also lunarvim, it has many
quality of life configs, but some of them are not suited for my personal use. Plus the classic 
vim is so slow compared to neovim. So I have to manually migrate to neovim and do a lot of tweaking 
myself.


The directory looks a bit daunting at first, but over the years I found it quite
easy to maintain and debug.

ginit.vim and neovim-context-menu is for people that use windows and gui app
like neovim-qt, if you are serious about using neovim for all your text editing
needs, you will want that. But if you're fixed on doing everything on the
terminal, you can ignore them or even delete them to make your nvim directory a
little cleaner.


## Disclaimer

This is still a work in progress, many parts can still be broken, also I'm not a professional 
programmer, I'm more of a vim hobbiest and casual programmer. So if you find my code to be a mess,
all constructive critisism are welcomed.

Finally, English is not my native language, if you find typos and grammar errors, please let me know.

## Installation

I'd suggest you have winget, scoop installed on your windows system, this will
make your life a lot easier. (Linux has either apt, dnf, pacman, brew or even
nixenv etc. ; Mac has brew.) Please for your own sake, get a package manager for your
system.


### Dependencies


```
git
nodejs
npm
curl
python
yarn
im-select
```

A patched font to display properly various icons and glyphs.
I personally like hack-nf.
If you dont' like hack-nf, I would also recommend popular ones like jetbrainsmono, fira code and
caskadyia cove.

There are many ways to install these beautiful fonts, they're just one google
search away.

[nerd-fonts](https://www.nerdfonts.com/)

### winget and scoop

Winget should be bundled with windows 11 out of the box, copy the following code
in your powershell to try it out:

```winget --version```

If it returns the version number of winget instead of a bunch of red errors, you
are good to go. Otherwise you can download winget appimage from Microsoft's
official github page.

After that, the fastest way to install neovim is by coping the following code
in your powershell:

```winget install neovim.neovim```

### Scoop is way better

setup scoop on your system and install neovim and all the required dependencies.


Before continuing the next step, please make sure you have git, curl, 7zip,
lessmsi, dark installed in your system. If not, please copy this line to your
powershell and hit enter:

``` scoop install git 7zip curl lessmsi dark ```

While you at it, also do this:

``` 
scoop bucket add extras 
scoop bucket add nerd-fonts
```

Then installing everything would just look like this:

```
scoop install neovim
scoop install git
scoop install python
scoop install wget
scoop install hack-nf

npm install -g yarn
npm install -g neovim

pip install pynvim
```

### meovim install

on Windows, open up terminal(cmd or powershell) and do:

```git clone https://github.com/mino29/meovim.git "$env:LOCALAPPDATA\nvim"```

on Linux/Mac, open up terminal(cmd or powershell) and do:

```git clone https://github.com/mino29/meovim.git ~/.config/nvim```

After cloning, open up nvim, it should automatically install various plugins,
After that's done, reopen nvim, it should be ready to go.

If nothing's happening, try do:

```:PackerSync```

I'v test it on 2 windows 10 machines; 
arch linux(gnome desktop), fedora, WSL2(ubuntu).
Haven't test it on mac though, I don't really like mac these days. (Maybe when
the notch thing is gone.) 

But if you do own a mac, please tell me how the experience goes.

if your internect connection is unstable as mine, 
it should take a minute or two. 

However if your internet is pretty good and you are not based in mainland China,
(if you are: guys, set up a proxy service for)
the installation should be instantaneous. (less than 15 seconds)

### plugins and custom key mappings 

The leader key is space, a lot of the frequently used key binds are set with
whichkey, which has an elegant ui prompt. If you just started to use meovim,
this will save you a lot of headaches from remembering seemingly crazy key binds like gcc
for commenting and space+tf for open up a float terminal.

Most of the time you just press space or g to do slightly advanced actions.

If you find some key mappings not to your taste, I'd suggest go in kemaps.lua
and whichkey.lua, and make your own adjustments.


I was so used to ","(comma) as my leader key, old habit from using the "Ultimate
Vimrc", I tried so hard on remapping a lot of neovim configs that I came across
into using comma as my leader key. Ultimately hitting comma is not that
ergonomic if you hit it very often. Trust me, space is the way to go.

Or not, if you want to suffer as I did. :-)

### how to update

If you want a stable text editor/IDE, I'd suggest you update as little as you can.
But if you want the latest from me, you can just cd into your nvim
directory and do:

```
git pull
```

then open up neovim and do

```
:PackerSync
```

Unless some major updates happen to neovim, I'll be mostly doing bug fixes and make
meovim more speedy and stable. Adding more features will only slow it down and
cause stability issues. Nobody wants that.

Beside, cat is pretty lazy, so updates from meovim won't be very often. :-)


## Get healthy

Everyone's system is a bit different, so after install I strongly recommend in
neovim you do:

```
:checkhealth
```
You might notice that you clipboard tool is missing, let's fix that

- On windows `yank32.exe` should be bundled with neovim
- On mac `pbcopy` should be builtin
- On linux you might have to install xsel

- On ubuntu/debian
```
sudo apt install xsel -y
```
- On Arch linxu

```
sudo pacman -S xsel --noconfirm
```
- On fedora linxu

```
sudo dnf install xsel -y
```
(the -y and --noconfirm flags are for lazy people like me who don't want to
press extra enter button once)


Next step is to install python and node(if you don't use coc.nvim, then node is
optional)

- Neovim python support

```
pip install pynvim
pip install dark
```

- Neovim node support

```
npm i -g neovim
npm i -g yarn
```

**NOTE**
Make sure you have python and node installed, I mostly use anaconda and nvm.
They are not the lightest, but they are well known and widely available.


**Auto Switch Input method**

For users that use multiple languages keyboard/input, for example Arabic,
Japanese, Korean, Chinese etc. I'd highly recommend you download im-select and
add to your path.

It ensures that when you in normal mode, your input will automatically switch to
English(US), thus your keybinds and all the fast text editing is still there.
You don't have to manually switch to it between normal mode and insert mode.

If you use English for both code and typing comments and other general text
editing, you won't be needing this. You should remove [im-select](https://github.com/daipeihust/im-select) 
from plugins.lua and other related settings from your respective os config file (i.e. windows.lua/mac.lua)

I haven't figure out a way to implement im-select in linux, it's said that linux
has other ways instead of im-select to solve this kind of problem, sadly I
wasn't able to find the solution myself. Please let me know if you know how to
do it.


## Inspiration

I'm merely a (neo)vim tinker, I barely know python, so most of the configs of
Meovim is sourced from different amazing actual developers.

You can check them out for more inspirations to build your own neovim.

- [ultimate vimrc](https://github.com/amix/vimrc)
- [lunarvim](https://github.com/LunarVim/LunarVim)
- [craftzdog](https://github.com/craftzdog/dotfiles-public)
- [neuralnine](https://github.com/NeuralNine/config-files)



(neo)vim in video form
- [neovim from scratch(playlist)](https://www.youtube.com/playlist?list=PLhoH5vyxr6Qq41NFL4GvhFp-WLd5xzIzZ)
- [Awesome neovim setup from scartch](https://www.youtube.com/results?search_query=neovim)
- [Porting Your Neovim Configuration to Lua](https://www.youtube.com/watch?v=aG4aDVj3kAc)
- [Set up Neovim on a new M2 Macbook Air](https://www.youtube.com/watch?v=ajmK0ZNcM4Q&t=784s)




I also got a lot of pieces from various stackoverflow and reddit posts. I can no
longer recall exactly where I got them from. But thanks internet.
