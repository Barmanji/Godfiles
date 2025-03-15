# My dotfiles
My Godfiles, which may won't work in your device.
Still if you want to try, go ahead.

# Manual Install
## Repository and Installations needed

### Install Arch
- Do it for real(Without Script!). I will be giving arch related install methods (yay/pacman), if you are in other distro or Mac figure it out.
#### Packages
- I have all packages in [Packages]("https://github.com/Barmanji/Godfiles/tree/master/InstalledArchPackages")
- Some additional ones for [OCR-Screen-Text](https://github.com/TheBrightSoul/Screen-Text-Reader) capture. Made by my friend [TheBrightSoul](https://github.com/TheBrightSoul),Drop him a follow or block him xd.
- `sudo pacman -5 --nesded tesseract tesseract-data-eng grin slurp wl-clipboard`

#### Install Yay
- `sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si`

#### fzf-git
- `git clone https://github.com/junegunn/fzf-git.sh.git`

#### rg
- `git clone https://github.com/BurntSushi/ripgrep.git`

### Tmux
- `yay -S tmux`

Tmux plugins manager
- `git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`

### Git

-   Check this by running `git --version` in the shell to see if the command is available
-   it will most likely prompt you to install it with Xcode Command Line tools.
    - (Skip this step if command line tools already installed)

### GNU Stow
- Refer the docs : [Read More](https://www.gnu.org/software/stow/)
```
yay -S stow
```

## Installation of this repo using stow

First, check out dotfiles repo in your $HOME directory using git

```
$ git clone git@github.com:Barmanji/Godfiles.git
$ cd Godfiles
```
#### Before Running any stow commands
- At least for this config structure
- **!! make sure home directories is set to have the same structure first !!**
- for instances ( Watch for Sub-directories )
    - if any subdirectory eg: `~/.config` dont exist in $HOME then `mkdir .config`
    - other config files that don't exist in $HOME atm, should not have any problems
      for stow symlinks


then use GNU stow to create symlinks
> [!IMPORTANT]
> make sure you are in your dotfiles directory

- `cd dotfiles`
- as long as you have the structure setup in $HOME correctly
- running `stow .` should be enough

##### However, for assurance
- run stow commands like below for each directory in dotfiles
- re-check if the symlinks are correct for each sub-directories and files
```bash

#or run them separately

stow -t ~ nvim
stow -t ~ zsh
```

