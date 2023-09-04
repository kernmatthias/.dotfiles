local remap = require "user.keymap"

function ApplyBoneMapping()
	remap.nmap("b", "h")
	remap.nmap("n", "j")
	remap.nmap("r", "k")
	remap.nmap("s", "l")
end
