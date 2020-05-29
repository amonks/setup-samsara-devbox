# Defined in /tmp/fish.7gXMhc/cherry-pick-many.fish @ line 1
function cherry-pick-many

	set branches $argv
	set commits
	while read -l commit
	        set -a commits $commit
	end
	echo "cherry picking $commits into $branches"
	for branch in $argv
	        git checkout driver2/$branch
	        git reset --hard origin/driver2/$branch
	        git checkout -b amonks/$branch-skip-logs
	        for commit in $commits
	                git cherry-pick $commit
	        end
	        git p
	end
end
