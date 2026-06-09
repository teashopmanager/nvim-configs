-- nvim-cmp: completion engine for Neovim providing LSP suggestions,
-- snippet support, and UI-enhanced autocomplete with manual documentation toggle
return {
	"hrsh7th/nvim-cmp",

	dependencies = {
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-nvim-lsp",
		"rafamadriz/friendly-snippets",
		"onsails/lspkind.nvim",
	},

	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local lspkind = require("lspkind")

		require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},

			sources = {
				{ name = "nvim_lsp", priority = 1000 },
				{ name = "luasnip", priority = 900 },
			},

			view = {
				docs = {
					auto_open = false,
				},
			},

			window = {
				completion = cmp.config.window.bordered({
					max_height = 8,
				}),
				documentation = cmp.config.window.bordered(),
			},

			completion = {
				completeopt = "menu,menuone,noinsert",
			},

			mapping = cmp.mapping.preset.insert({
				["<Up>"] = cmp.mapping.select_prev_item(),
				["<Down>"] = cmp.mapping.select_next_item(),
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.confirm({ select = true })
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					else
						fallback()
					end
				end, { "i", "s" }),
				["<Enter>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.confirm({ select = true })
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					else
						fallback()
					end
				end, { "i", "s" }),
				["<C-d>"] = cmp.mapping(function()
					if cmp.visible_docs() then
						cmp.close_docs()
					else
						cmp.open_docs()
					end
				end, { "i", "s" }),
			}),

			formatting = {
				fields = { "kind", "abbr", "menu" },

				format = function(entry, vim_item)
					local lspkind = require("lspkind")

					local kind = vim_item.kind

					local icon = lspkind.symbolic(kind, { mode = "symbol" })
					vim_item.kind = (icon or "") .. " "

					vim_item.abbr = vim_item.abbr

					vim_item.menu = kind

					return vim_item
				end,
			},
		})
	end,
}
