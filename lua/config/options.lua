local opt = vim.opt

vim.opt.shortmess:append("I")

-- Clipboard for yanking
opt.clipboard = "unnamedplus" -- system clipboard for yank

--Line numbers
opt.number = true
opt.relativenumber = true

--Indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true

--Appearance
opt.wrap = false
opt.termguicolors = true
opt.signcolumn = "yes"

--Scrolling
opt.scrolloff = 8

-- File handiling / Undo
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.config/nvim/undodir"
opt.undofile = true

--Performance
opt.updatetime = 50

-- Configure how diagnostics are displayed: inline virtual text, underlines, and sign column icons.
-- Errors are sorted by severity and diagnostics won't update while typing.
vim.lsp.inlay_hint.enable(true)

vim.diagnostic.config({
	virtual_text = {
		prefix = "●", -- symbol in front of inline messages
		spacing = 2, -- space between text and code
	},
	signs = true, -- show signs in the sign column
	underline = true, -- underline problematic code
	update_in_insert = false, -- don’t spam diagnostics while typing
	severity_sort = true, -- errors before warnings, etc.
})
