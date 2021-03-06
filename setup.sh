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

sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo apt-add-repository ppa:fish-shell/release-3 -y

sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y

end_section
echo



if ! which fish; then
  section Installing fish shell
  sudo apt-get install fish -y
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
  sudo apt-get install neovim  -y
  end_section
fi
echo

if ! which rg; then
  section Installing ripgrep

  # https://github.com/fish-shell/fish-shell/issues/5822#issuecomment-589959589
  # hopefully this won't be necessary in the next version of ripgrep
  sudo dpkg-divert --add --divert  /usr/share/fish/completions/rg.fish.0 --rename --package ripgrep /usr/share/fish/completions/rg.fish

  rg_version=11.0.2
  wget https://github.com/BurntSushi/ripgrep/releases/download/${rg_version}/ripgrep_${rg_version}_amd64.deb
  sudo apt install ./ripgrep_${rg_version}_amd64.deb
  rm ./ripgrep_${rg_version}_amd64.deb
  end_section
fi
echo

if ! which fd; then
  section Installing fd
  fd_version=7.4.0
  wget https://github.com/sharkdp/fd/releases/download/v${fd_version}/fd_${fd_version}_amd64.deb
  sudo apt install ./fd_${fd_version}_amd64.deb
  rm ./fd_${fd_version}_amd64.deb
  end_section
fi
echo

if ! test -f /usr/share/autojump/autojump.fish; then
  section Installing autojump
  sudo apt-get install autojump -y
  end_section
fi
echo

if ! which mosh; then
  section Installing mosh
  sudo apt-get install mosh -y
  end_section
fi
echo

if ! which node; then
  section Installing node
  curl -sL https://deb.nodesource.com/setup_13.x | sudo bash -
  sudo apt-get install -y nodejs
  end_section
fi
echo

if ! which neovim-node-host; then
  section Installing neovim node host
  sudo npm i -g neovim
  end_section
fi
echo

if ! which fzf; then
  section Installing fzf
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install
  end_section
fi
echo

if ! which jq ; then
  section Installing jq
  sudo apt-get install -y gq
  end_section
fi
echo

if ! which direnv ; then
  section Installing direnv
  sudo apt-get install -y direnv
  end_section
fi
echo

if ! which iotop ; then
  section Installing iotop
  sudo apt-get install -y iotop
  end_section
fi
echo

if ! which dot ; then
  section Installing graphiz
  sudo apt-get install -y graphviz
  end_section
fi
echo

if ! which tldr ; then
  section Installing tldr
  sudo apt-get install -y tldr
  end_section
fi
echo

if ! which tree ; then
  section Installing tree
  sudo apt-get install -y tree
  end_section
fi
echo

if ! which ctop ; then
  section Installing ctop
  sudo apt-get install -y ctop
  end_section
fi
echo

if ! which htop ; then
  section Installing htop
  sudo apt-get install -y htop
  end_section
fi
echo




python3 -m pip install --user --upgrade pynvim
python2 -m pip install --user --upgrade pynvim


if ! test -f ~/locals.fish ; then
  echo "set -u machine_sigil \"₷ \"" > ~/locals.fish
  echo "Edit ~/locals.fish"
  echo
fi






section 🎉 Done!

echo If this is your first boot, set a password with,
echo
echo '    sudo passwd ubuntu'
echo
echo then set your shell with,
echo
echo '   chsh -s /usr/bin/fish'
echo
