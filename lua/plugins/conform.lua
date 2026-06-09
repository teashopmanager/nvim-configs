-- conform.nvim: automatic code formatting plugin that runs 
-- language-specific formatters on save (e.g. clang-format, prettier, stylua, black)
return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				c = { "clang-format" },
				css = { "prettier" },
				lua = { "stylua" },
				python = { "isort", "black" },
			},
			format_on_save = {
				lsp_fallback = false,
				async = false,
				timeout_ms = 500,
			},
		})
	end,
}
