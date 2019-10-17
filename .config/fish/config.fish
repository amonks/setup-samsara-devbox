[ -f /usr/share/autojump/autojump.fish ]; and source /usr/share/autojump/autojump.fish

set fish_greeting "🐋 🐋🐋🐋🐋🐋🐋🐋🐋🐋🐋🐋🐋🐋🐋🐋🐋🐋🐋🐋🐋🐋🐋🐋🐋🐋🐋🐋🐋🐋🐋🐋🐋🐋🐋🐋🐋🐋🐋🐋🐋"

fish_vi_key_bindings

set -x FZF_DEFAULT_COMMAND 'fd --type f -I'

set -x PATH $PATH ~/bin

eval (direnv hook fish)

alias config='/usr/bin/git --git-dir=/home/ubuntu/.cfg/ --work-tree=/home/ubuntu'

if test $TERM != "screen"
  exec tmux
end

