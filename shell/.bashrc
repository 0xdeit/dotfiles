# .bashrc

# ubuntu does not load .bashrc by default? flag workaround
loaded_bashrc=1

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
# colored prompt

# color: cyan
# bash= \e0;36m
# tput= tput setaf 6

# standard prompt, but colored
#export PS1="\e\[0;36m\][\u \W]\$\e\[0m\] "

# two line prompt with date, time, full working directory and command number
#export PS1="\[\e[0;36m\][\d]\u (\w)\n[\A:\#]\$ \[\e[0m\]"

# two line prompt with ISO8601 date, time, full working directory and command number
#export PS1="\[\e[0;36m\][\D{%F} \A] (\w)\n\u (\#)\$ \[\e[0m\]"

# using tput
export PS1="\[$(tput setaf 6)\][\D{%F} \A] \
$(tput bold)\w\n\
\u (\#)\$ \[$(tput sgr0)\]"

# user variables
dotfiles_dir=~/git/dotfiles

# systems package manager aliases

distro=$(lsb_release -i -s)

function sch(){
    case $distro in
        'Ubuntu'|'Debian') sudo apt-cache search $1 ;;
        'Fedora') sudo dnf search $1 ;;
    esac
}

function ins(){
    case $distro in
        'Ubuntu'|'Debian') sudo apt install $@ ;;
        'Fedora') sudo dnf install $@ ;;
    esac
}

function upg(){
    case $distro in
        'Ubuntu'|'Debian') sudo apt upgrade -y;;
        'Fedora') sudo dnf upgrade -y;;
    esac
}

function upd(){
    echo "Running system update on $distro"
    case $distro in
        'Ubuntu'|'Debian') sudo apt update ;;
        'Fedora') sudo dnf check-update ;;
    esac
}

function inf(){
    case $distro in
        'Ubuntu'|'Debian') sudo apt-cache show $1 ;;
        'Fedora') sudo dnf info $1 ;;
    esac
}

function rem(){
    case $distro in
        'Ubuntu'|'Debian') sudo apt remove $1 ;;
        'Fedora') sudo dnf remove $1 ;;
    esac
}

# general usage
# create directory and cd into it
function md(){
    mkdir $1 && cd $1;
}

# create a directory, cd into it and initialize it as a git repo
function gmd(){
    mkdir $1 && cd $1 && git init;
}

# goto dev directory
alias devd="cd ~/dev && ls"

# goto git directory
alias gitd="cd ~/git && ls"

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
    cd $dotfiles_dir && git pull && git status $dotfiles_dir;
}

function dotfiles_update(){
    echo "Current configured dotfiles repo $dotfiles_dir \nUpdating local configurations to repo...";
    # TODO: Only try to update configuration if the program is installed.
    update_bashrc && update_swayc && update_vimrc && update_waybarc;
    cd $dotfiles_dir;
    # TODO: Only show status of master branch?
    git status;
    cd -;
}

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

alias gp="git push"
alias gg="git pull"
alias gcl="git clone"
alias gs="git status"
alias gd="git diff HEAD"

source ~/.profile
