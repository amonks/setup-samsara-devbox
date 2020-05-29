# Defined in /tmp/fish.jzGJmE/read-confirmation.fish @ line 1
function read-confirmation
  while true
    read -l -P 'Do you want to continue? [y/N] ' confirm

    switch $confirm
      case Y y
        return 0
      case '' N n
        return 1
    end
  end
end
