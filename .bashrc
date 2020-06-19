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
alias sys-sch="sudo dnf search"
alias sys-ins="sudo dnf install"
alias sys-upg="sudo dnf upgrade"
alias sys-upd="sudo dnf check-update"
alias sys-inf="sudo dnf info"
alias vim="nvim"
alias v="nvim"
alias vimc="nvim ~/.config/nvim/init.vim"
alias bashrc="nvim ~/.bashrc"
alias swayc="nvim ~/.config/sway/config"
alias alacrittyc="nvim ~/.config/alacritty/alacritty.yml"
alias vcpkg="~/git/vcpkg/vcpkg"
source /home/gallo/git/vcpkg/scripts/vcpkg_completion.bash

source ~/.profile
