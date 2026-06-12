-- telescope.nvim: fuzzy finder for Neovim that enables fast searching
-- and opening of files, buffers, and other lists with an interactive UI and extensible pickers
return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-telescope/telescope-ui-select.nvim",
	},

	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local action_state = require("telescope.actions.state")

		telescope.setup({
			defaults = {
				mappings = {
					i = {
						["<Esc>"] = actions.close,
					},
				},
			},

			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown({
						previewer = false,
					}),
				},
			},
		})

		telescope.load_extension("fzf")
		telescope.load_extension("ui-select")
	end,
}
