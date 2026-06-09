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
			mode = "exact", -- "exact", "search" (regex), or "fuzzy"
			incremental = false, -- behave like incsearch while typing
		},
		jump = {
			jumplist = true,
			autojump = false,
			history = false, -- add pattern to search history
			nohlsearch = true, -- clear search highlight after jumping (very handy)
		},
		label = {
			uppercase = false,
			current = true, -- label the current/closest match, always jumpable with <CR>
			after = true, -- show label after the match
			style = "overlay", -- "eol" | "overlay" | "right_align" | "inline"
			distance = true, -- label matches closer to cursor first
			rainbow = {
				enabled = true,
				shade = 5,
			},
		},
		highlight = {
			backdrop = true, -- dims everything except matches (makes labels pop)
			matches = true, -- highlight the search matches themselves
		},
		modes = {
			char = {
				enabled = true,
				jump_labels = true,
				multi_line = true, -- f/t searches across multiple lines
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
