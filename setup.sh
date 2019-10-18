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
apt-add-repository ppa:fish-shell/release-3 -y

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

if ! which rg; then
	section Installing ripgrep
	rg_version=11.0.2
	wget https://github.com/BurntSushi/ripgrep/releases/download/${rg_version}/ripgrep_${rg_version}_amd64.deb
	apt install ./ripgrep_${rg_version}_amd64.deb
	rm ./ripgrep_${rg_version}_amd64.deb
	end_section
fi
echo

if ! which fd; then
	section Installing fd
	fd_version=7.4.0
	wget https://github.com/sharkdp/fd/releases/download/v${fd_version}/fd_${fd_version}_amd64.deb
	apt install ./fd_${fd_version}_amd64.deb
	rm ./fd_${fd_version}_amd64.deb
	end_section
fi
echo

if ! test -f /usr/share/autojump/autojump.fish; then
	section Installing autojump
	apt-get install autojump -y
	end_section
fi
echo

if ! which mosh; then
	section Installing mosh
	apt-get install mosh -y
	end_section
fi
echo




section 🎉 Done!

echo If this is your first boot, set a password with,
echo
echo '    sudo passwd ubuntu'
echo
echo then set your shell with,
echo
echo '   chsh -s /usr/bin/fish'
echo
