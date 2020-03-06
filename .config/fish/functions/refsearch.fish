# Defined in /tmp/fish.GDQy2u/refsearch.fish @ line 1
function refsearch -a term file
  echo searching through reflog for $term in $file
  for commit in (git reflog -- ./"$file" | cut -d' ' -f1)
    if git show $commit:./"$file" | grep "$term"
      echo FOUND IT 
      echo $commit
      break
    end
  end
end
