-- flash.nvim: fast navigation plugin for jumping to text targets 
-- in the buffer using labels, enhanced search, and motion-based cursor movement
return {
	"folke/flash.nvim",
	event = "VeryLazy",
	---@type Flash.Config
	opts = {
		search = {
			multi_window = true,
			wrap = true,
			mode = "exact", 
			incremental = false,
		},
		jump = {
			jumplist = true,
			autojump = false,
			history = false, 
			nohlsearch = true, 
		},
		label = {
			uppercase = false,
			current = true, 
			after = true, 
			style = "overlay", 
			distance = true, 
			rainbow = {
				enabled = true,
				shade = 5,
			},
		},
		highlight = {
			backdrop = true,
			matches = true,
		},
		modes = {
			char = {
				enabled = true,
				jump_labels = true,
				multi_line = true,
			},
			search = {
				enabled = true,
			},
		},
		prompt = {
			enabled = true,
			prefix = { { "⚡", "FlashPromptIcon" } },
		},
	},
}
