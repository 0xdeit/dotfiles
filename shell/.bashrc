# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# User specific aliases and functions

# user variables
dotfiles_dir="$HOME/git/dotfiles"

# systems package manager aliases
alias sys-sch="sudo dnf search"
alias sys-ins="sudo dnf install"
alias sys-upg="sudo dnf upgrade"
alias sys-upd="sudo dnf check-update"
alias sys-inf="sudo dnf info"
alias sys-rem="sudo dnf remove"

# general usage
# create directory and cd into it
function md(){
    mkdir $1 && cd $1;
}

# create a directory, cd into it and initialize it as a git repo
function gmd(){
    mkdir $1 && cd $1 && git init;
}

# $EDITORS
alias vim="nvim"
alias v="nvim"

# Configs
function bashup(){
    echo "Updating bashrc...";
    source ~/.bashrc && echo "Done.";
}

function send_to_dotfiles_scm(){
    # TODO: Give error if there are more than 1 argument to the function.
    if [[ -f $1 ]]; then
        cp $1 $dotfiles_dir;
    elif [[ -d $1 ]]; then
        cp -r $1 $dotfiles_dir;
    else
        echo "Not a file or a directory, skipping"
    fi
}

function update_bashrc(){
    cp ~/.bashrc $dotfiles_dir/shell;
}

function update_vimrc(){
    cp  ~/.config/nvim/init.vim $dotfiles_dir/nvim;
}

function update_swayc(){
    send_to_dotfiles_scm ~/.config/sway;
}

function update_waybarc(){
    send_to_dotfiles_scm ~/.config/waybar;
}

function update_alacrittyc(){
    cp ~/.config/alacritty/alacritty.yml $dotfiles_dir/alacritty
}

alias vimc="nvim ~/.config/nvim/init.vim && update_vimrc"
alias bashrc="nvim ~/.bashrc && source ~/.bashrc && update_bashrc"
alias swayc="nvim ~/.config/sway/config && update_swayc"
alias alacrittyc="nvim ~/.config/alacritty/alacritty.yml && update_alacrittyc"
alias waybarc="nvim -p ~/.config/waybar/config ~/.config/waybar/style.css && update_waybarc"

function dotfiles(){
    cd $dotfiles_dir && git status;
}

function dotfiles_update(){
    echo $dotfiles_dir;
    update_bashrc && update_swayc && update_vimrc && update_waybarc;
    git status $dotfiles_dir;
}

# vcpkg is a C\C++ package manager
alias vcpkg="~/git/vcpkg/vcpkg"
source /home/gallo/git/vcpkg/scripts/vcpkg_completion.bash

# git
alias ga="git add"
alias gaa="git add *"

function gac(){
    git add $1 && git commit -m "$2";
}

alias gr="git rm"
alias gc="git commit -m"

function gcp(){
    git commit -m $1 && git push;
}

alias gpsh="git push"
alias gpll="git pull"
alias gs="git status"
alias gd="git diff HEAD"

source ~/.profile
