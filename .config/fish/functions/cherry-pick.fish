function cherry-pick
    set branch "$argv"
    echo "cherry picking into $branch"

    git summon "$branch"
    git checkout "$branch"
    git reset --hard "origin/$branch"

    git checkout -b "amonks/cp-$branch"

    set picks (cat ~/cherry-picks)
    for pick in $picks
        set sha (echo $pick | cut -d' ' -f1)
        git cherry-pick $sha
    end

    git p
end
