-- neo-tree.nvim: modern file explorer for Neovim providing
-- a tree-style sidebar with filesystem navigation, buffers, and git integration
return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		lazy = false,
		opts = {
			filesystem = {
				follow_current_file = {
					enabled = true,
				},
			},
		},
	},
}
