# Defined in /tmp/fish.NzoQkV/new-pr.fish @ line 2
function new-pr
	set branch $argv
	set commits

	while read -l commit_line
	  set commit (echo $commit_line | cut -d' ' -f1)
	  set -a commits $commit
	end

	echo
	echo "COMMITS"
	for commit in $commits
	  git show "$commit" --stat
	end
	echo
	echo "TARGET BRANCH $branch"

	git master
	git branch -D amonks/$branch
	git checkout -b amonks/$branch

	for commit in $commits
		git cherry-pick $commit
	end
	git p
end
