local avante = require("avante")

avante.setup({
	providers = {
		ollama = {
			-- endpoint = "localhost:11434",
			model = "hf.co/byteshape/Qwen3-30B-A3B-Instruct-2507-GGUF:Qwen3-30B-A3B-Instruct-2507-IQ4_XS-3.87bpw.gguf",
			is_env_set = require("avante.providers.ollama").check_endpoint_alive,
		},
	},
	selector = {
		provider = "telescope",
		provider_opts = {},
	},
	auto_suggestions_provider = "ollama",
	behaviour = {
		auto_suggestions = false,
	},
})
