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

# vcpkg is a C\C++ package manager
alias vcpkg="~/git/vcpkg/vcpkg"
source /home/gallo/git/vcpkg/scripts/vcpkg_completion.bash

# git
alias ga="git add"
alias gaa="git add *"
alias gc="git commit -m"
alias gpsh="git push"
alias gpll="git pull"
alias gs="git status"
alias gd="git diff HEAD"

function send_to_dotfiles_scm(){
    cp $1 ~/git/dotfiles
}

function update_bashrc(){
    send_to_dotfiles_scm ~/.bashrc
}

function update_vimrc(){
    send_to_dotfiles_scm ~/.config/nvim/init.vim
}

source ~/.profile
