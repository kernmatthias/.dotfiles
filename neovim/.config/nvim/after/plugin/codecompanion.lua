--[[
require("codecompanion").setup({
	strategies = {
		chat = { adapter = "ollama" },
		inline = { adapter = "ollama" },
	},
	adapters = {
		ollama = require("codecompanion.adapters").extend("ollama", {}),
	},
})
--]]
