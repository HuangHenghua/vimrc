# Vim Config

## 1. Prerequisite
- git >= 2.2
- ctags
- ripgrep

### 1.1 Update Git:

```bash
yum install https://packages.endpointdev.com/rhel/7/os/x86_64/endpoint-repo.x86_64.rpm
```
<https://packages.endpointdev.com/>

### 1.2 Install ctags

- Use yum
```bash
sudo yum install ctags
```

- Use src
```bash
tar xvf ctags-5.8.tar.gz
cd ctags-5.8
./configure --prefix=/app/bin/ctags
make
make install

export PATH=$PATH:/app/bin/ctags
```
### 1.3 Install ripgrep
```bash
tar xvf ripgrep-13.0.0-x86_64-unknown-linux-musl.tar.gz

export PATH=$PATH:/app/bin/ripgrep
```

## 2. Install Vundle
### 2.1 Copy plugin
```bash
mkdir ~/.vim/bundle
cp -r /path/to/Vundle.vim  ~/.vim/bundle/
cp /path/to/Vundle.vim/test/minirc.vim ~/.vimrc
```

###  2.2 Install plugin
Change `.vimrc` plugin path to:
`file:///path/to/Vundle.vim`

Then open vim and run `:PluginInstall`.

## 3. Install others plugins
Change ~/.vimrc like:
```bash
set nocompatible
syntax on
filetype off
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()
Plugin 'file:///opt/vim/Vundle.vim'
Plugin 'file:///opt/vim/rainbow'
Plugin 'file:///opt/vim/lightline.vim'
Plugin 'file:///opt/vim/nerdcommenter'
Plugin 'file:///opt/vim/nerdtree'
Plugin 'file:///opt/vim/papercolor-theme'
Plugin 'file:///opt/vim/LeaderF'
call vundle#end()
filetype plugin indent on
```
Open vim and run `:PluginInstall`

## 4. Change `.vimrc`
Copy _vimrc to `~/.vimrc`
