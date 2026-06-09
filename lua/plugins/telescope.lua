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

						["<CR>"] = function(prompt_bufnr)
							local picker = action_state.get_current_picker(prompt_bufnr)
							local selections = picker:get_multi_selection()

							if #selections > 0 then
								actions.close(prompt_bufnr)

								for _, file in ipairs(selections) do
									vim.cmd("edit! " .. file.path)
								end
							else
								actions.select_default(prompt_bufnr)
							end
						end,
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
