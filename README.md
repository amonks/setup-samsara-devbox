```bash
git clone --bare <git-repo-url> $HOME/.cfg
git --git-dir=$HOME/.cfg/ --work-tree=$HOME checkout
./setup.sh
```

