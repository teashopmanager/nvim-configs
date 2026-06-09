-- mini.pairs: uto-closes brackes, quotes and pairs like () [] {} "" ''
return {
	"echasnovski/mini.pairs",
	event = "VeryLazy",
	opts = {
		modes = { insert = true, command = true, terminal = false },
		mappings = {
			["("] = { action = "open", pair = "()", neigh_pattern = "[^\\]." },
			["["] = { action = "open", pair = "[]", neigh_pattern = "[^\\]." },
			["{"] = { action = "open", pair = "{}", neigh_pattern = "[^\\]." },
			['"'] = { action = "closeopen", pair = '""', neigh_pattern = "[^\\]." },
			["'"] = { action = "closeopen", pair = "''", neigh_pattern = "[^%a\\]." },
			["`"] = { action = "closeopen", pair = "``", neigh_pattern = "[^\\]." },
		},
	},
	config = function(_, opts)
		require("mini.pairs").setup(opts)
	end,
}
