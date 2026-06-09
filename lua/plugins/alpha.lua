--Startup dashboard, provides UI with quick-action buttons for Telescope, file navigation etc.
return {
	"goolord/alpha-nvim",
	dependencies = { "nvim-telescope/telescope.nvim" },
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		dashboard.section.header.val = {
			"Welcome back",
			"Neovim is ready",
		}

		dashboard.section.buttons.val = {
			dashboard.button("p", "󰉋  Recent projects", ":Telescope oldfiles cwd_only=false<CR>"),
			dashboard.button("f", "󰈞  Find file", ":Telescope find_files<CR>"),
			dashboard.button("r", "  Recent files", ":Telescope oldfiles<CR>"),
			dashboard.button("c", "  Config", ":e ~/.config/nvim/init.lua<CR>"),
			dashboard.button("q", "󰅚  Quit", ":qa<CR>"),
		}

		alpha.setup(dashboard.opts)
	end,
}
