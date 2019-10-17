#! /usr/bin/env bash

dir=`pwd`


set -e
trap "[[ \$BASH_COMMAND != echo* && \$BASH_COMMAND != section* ]] && echo \$(prompted \$BASH_COMMAND)" DEBUG

function prompted() {
	echo -e "\e[32m> $@\e[39m"
}

function section() {
	echo -e "\n\n\n\e[1m\e[35m$@\e[39m\e[0m\n"
}

function end_section() {
	echo -e "\n\e[1m\e[35mDone.\e[39m\e[0m\n"
}




section Updating package repositories

add-apt-repository ppa:neovim-ppa/unstable -y

apt-get update -y
apt-get upgrade -y
apt-get dist-upgrade -y

end_section
echo



if ! which fish; then
	section Installing fish shell
	apt-get install fish -y
	end_section
fi
echo

if ! grep -q fish /etc/shells; then
	section Approving fish shell
	echo "/usr/bin/fish" | tee -a /etc/shells
	end_section
fi
echo

if ! which nvim; then
	section Installing neovim
	apt-get install neovim  -y
	end_section
fi
echo



section 🎉 Done!

echo If this is your first boot, set a password with,
echo
echo     sudo passwd ubuntu
echo
echo then set your shell with,
echo
echo    chsh -s /usr/bin/fish
echo
