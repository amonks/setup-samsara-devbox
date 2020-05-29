# Defined in /tmp/fish.dHQuRP/p.fish @ line 1
function p
git master
and git checkout -b $argv
and git rebase -i HEAD~
and git p
and echo https://github.com/samsara-dev/backend/pull/new/amonks/$argv >> ~/prs
end
