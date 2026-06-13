return {
	"folke/which-key.nvim",
	event = "VeryLazy",

	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},

	opts = {
		icons = {
			breadcrumb = "»",
			separator = "➜",
			group = "+",
			ellipsis = "…",
			mappings = true,
		},

		win = {
			border = "rounded",
			padding = { 1, 2 },
		},

		show_help = true,
		show_keys = true,

		delay = 300,

		filter = function(mapping)
			return true
		end,

		spec = {z
			{ "<leader>f", group = "file/find" },
			{ "<leader>g", group = "git" },
			{ "<leader>d", group = "debug/docs" },
			{ "<leader>c", group = "code" },
			{ "<leader>w", group = "windows" },
			{ "<leader>t", group = "toggle" },
		},
	},

	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
	},

	config = function(_, opts)
		local wk = require("which-key")
		wk.setup(opts)

		-- optional: register leader groups explicitly (more reliable)
		wk.add({
			{ "<leader>f", group = "file/find" },
			{ "<leader>g", group = "git" },
			{ "<leader>d", group = "debug/docs" },
			{ "<leader>c", group = "code" },
			{ "<leader>w", group = "windows" },
			{ "<leader>t", group = "toggle" },
		})
	end,
}
