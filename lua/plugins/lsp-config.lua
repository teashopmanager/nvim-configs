-- mason.nvim + mason-lspconfig.nvim: toolchain for automatically installing and 
-- managing LSP servers (e.g. clangd, lua_ls, pyright) in Neovim
return {
	{
		"williamboman/mason.nvim",
		opts = {},
	},

	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"clangd",
				"lua_ls",
				"pyright",
			},
		},
		dependencies = {
			"williamboman/mason.nvim",
			"neovim/nvim-lspconfig",
		},
	},
}
