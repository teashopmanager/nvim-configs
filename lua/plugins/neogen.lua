return {
	"danymat/neogen",

	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},

	config = function()
		local ok, neogen = pcall(require, "neogen")
		if not ok then
			vim.notify("Neogen failed to load", vim.log.levels.ERROR)
			return
		end

		neogen.setup({
			enabled = true,
			languages = {
				cpp = {
					template = {
						annotation_convention = "doxygen",
					},
				},
				c = {
					template = {
						annotation_convention = "doxygen",
					},
				},
				java = {
					template = {
						annotation_convention = "javadoc",
					},
				},
			},
		})
	end,
}
