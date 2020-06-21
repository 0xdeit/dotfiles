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

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

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

# $EDITORS
alias vim="nvim"
alias v="nvim"

# Configs
alias vimc="nvim ~/.config/nvim/init.vim"
alias bashrc="nvim ~/.bashrc && source ~/.bashrc"
alias swayc="nvim ~/.config/sway/config"
alias alacrittyc="nvim ~/.config/alacritty/alacritty.yml"

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
    send_to_dotfiles_scm ~/.config/nvim;
}

function update_swayc(){
    send_to_dotfiles_scm ~/.config/sway;
}

function dotfiles(){
    cd $dotfiles_dir && git status;
}

function dotfiles_update(){
    update_bashrc && update_swayc && update_vimrc;
}

# vcpkg is a C\C++ package manager
alias vcpkg="~/git/vcpkg/vcpkg"
source /home/gallo/git/vcpkg/scripts/vcpkg_completion.bash

# git
alias ga="git add"
alias gaa="git add *"
alias gr="git rm"
alias gc="git commit -m"
alias gpsh="git push"
alias gpll="git pull"
alias gs="git status"
alias gd="git diff HEAD"

source ~/.profile
