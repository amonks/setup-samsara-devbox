function bulk-replace
	echo from $argv[1] to $argv[2] ; rg $argv[1] --files-with-matches | xargs -I '{}' sed -i '' -e "s/$argv[1]/$argv[2]/g" '{}';
end
