function pathsed --argument-names old_name new_name
  if test -z "$old_name"
    echo "must provide old name"
    return 1
  end

  if test -z "$new_name"
    echo "must provide new name"
    return 1
  end

  while true
    set matches (fd -t f $old_name)
    if test -z "$matches"
      return
    end
    for path in $matches
      set parts (echo $path | tr "/" "\n")
      set parts_so_far ""
      for part in $parts
	if ! test -z $parts_so_far
	  set parts_so_far "$parts_so_far/$part"
	else
	  set parts_so_far "$part"
	end

	if string match "*$old_name*" $part
	  set from $parts_so_far
	  set to (string replace $old_name $new_name $parts_so_far)
	  echo move $from $to
	  mv $from $to
	  break
	end
      end
    end
  end
end
