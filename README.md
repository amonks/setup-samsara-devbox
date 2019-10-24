```bash
git clone --bare git@github.com:amonks/setup-samsara-devbox.git $HOME/.cfg
git --git-dir=$HOME/.cfg/ --work-tree=$HOME checkout
./setup.sh
```

then…

```bash
vim ~/.tmux.conf
config add ~/.tmux.conf
config commit
config push
```

