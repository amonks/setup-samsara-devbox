function cherry-pick
    set branch "$argv[1]"
    set label "$argv[2]"

    if test -z "$branch"
      echo "must provide branch"
      echo "[set ~/cherry-picks to git log]; cherry-pick u50 fix-thingy"
      return 1
    end

    if test -z "$label"
      echo "must provide label"
      return 1
    end

    echo
    echo "cherry picking into $branch, and calling it $label"

    echo
    echo "checking out $branch"
    git summon "$branch"
    git checkout -f "$branch"

    echo
    echo "resetting $branch"
    git reset --hard "origin/$branch"

    echo
    set new_branch "amonks/cp-$label-$branch"
    echo "making new branch $new_branch"
    git checkout -b "$new_branch"

    echo
    echo "looping through commits"
    set picks (cat ~/cherry-picks)
    for pick in $picks
      echo
      echo "handling commit $pick"
      set sha (echo $pick | cut -d' ' -f1)
      echo
      echo "cherry picking sha $sha"
      git cherry-pick $sha
    end

    git p
    echo "URL TO MAKE CHERRY PICK PR INTO CORRECT BRANCH:"
    echo "https://github.com/samsara-dev/backend/compare/$branch...$new_branch?expand=1"
end

