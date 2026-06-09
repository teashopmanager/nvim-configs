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
				"clangd", -- C/C++
				"lua_ls", -- Lua
				"pyright", -- Python
			},
		},
		dependencies = {
			"williamboman/mason.nvim",
			"neovim/nvim-lspconfig",
		},
	},
}
