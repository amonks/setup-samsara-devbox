# Defined in /tmp/fish.sbvqbv/t.fish @ line 1
function t
	taskrunner (taskrunner -list | fzf | string trim)
end
