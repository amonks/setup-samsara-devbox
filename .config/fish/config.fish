# If config.fish is being executed outside a terminal, it's probably some
# program, like, say, ms-vscode-remote.remote-ssh. That program probably
# expects bash.
if test -z "$TERM"
  bash
end

set -x PATH $PATH ~/bin /snap/bin ~/.cargo/bin

set -x fish_emoji_width 1
set -x fish_ambiguous_width 1


if status --is-login
  set fish_greeting ""
  fish_vi_key_bindings

  # Use devbox thingy lol ask shane
  if ! pstree -s $fish_pid | grep -q mosh-server
    if test -f "/tmp/.devbox_agent.sock"
      if ! test "$SSH_AUTH_SOCK" = "/tmp/.devbox_agent.sock"
        set -x SSH_AUTH_SOCK /tmp/.devbox_agent.sock
      end
    end
  end

  test -f /usr/share/autojump/autojump.fish; and source /usr/share/autojump/autojump.fish
  eval (direnv hook fish)

  # files only, respect gitignore
  set -x FZF_DEFAULT_COMMAND 'fd --type f -I'

  # set up config repo
  alias config='/usr/bin/git --git-dir=/home/ubuntu/.cfg/ --work-tree=/home/ubuntu'
  config config --local status.showUntrackedFiles no

  source ~/secrets.fish
  source ~/.config/fish/abbreviations.fish

  # always use tmux
  if test "$TERM" != "screen"; and test -z "$TMUX"
    exec tmux new-session -A -s main
  end
end

