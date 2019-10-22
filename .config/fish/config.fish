[ -f /usr/share/autojump/autojump.fish ]; and source /usr/share/autojump/autojump.fish

set fish_greeting "🐋 🐋🐋🐋🐋🐋🐋🐋🐋🐋🐋🐋🐋🐋🐋🐋🐋🐋🐋🐋🐋🐋🐋🐋🐋🐋🐋🐋🐋🐋🐋🐋🐋🐋🐋🐋🐋🐋🐋🐋🐋"

fish_vi_key_bindings

set -x FZF_DEFAULT_COMMAND 'fd --type f -I'

set -x PATH $PATH ~/bin /snap/bin

eval (direnv hook fish)

alias config='/usr/bin/git --git-dir=/home/ubuntu/.cfg/ --work-tree=/home/ubuntu'

if not test -S ~/.ssh/ssh_auth_sock; and test -S "$SSH_AUTH_SOCK"
	ln -sf $SSH_AUTH_SOCK ~/.ssh/ssh_auth_sock
	export SSH_AUTH_SOCK=$HOME/.ssh/ssh_auth_sock
end

if test $TERM != "screen"
  exec tmux new-session -A -s main
end

