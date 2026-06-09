-- bufferline.nvim: adds a tab-like buffer line at the top of Neovim to
-- easily switch, manage, and visualize open buffers (with LSP diagnostics support)
return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	opts = {
		options = {
			mode = "buffers",
			separator_style = "slant",
			close_command = "bdelete! %d",
			right_mouse_command = "bdelete! %d",
			show_close_icon = true,
			show_buffer_close_icons = true,
			diagnostics = "nvim_lsp",
			diagnostics_indicator = function(count, level, diagnostics_dict, context)
				local icon = level:match("error") and " " or " "
				return " " .. icon .. count
			end,
		},
	},
}
