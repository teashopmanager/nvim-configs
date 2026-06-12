local map = vim.keymap.set

vim.g.mapleader = " "

-- General
map("n", "<leader>h", ":Alpha<CR>", { desc = "Home screen" })
map("n", "<C-h>", "<C-w>h", { desc = "Focus left window" })
map("n", "<C-l>", "<C-w>l", { desc = "Focus right window" })
map("n", "<C-j>", "<C-w>j", { desc = "Focus lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Focus upper window" })

--bufferline
map("n", "<A-Right>", ":BufferLineCycleNext<CR>", { desc = "Buffer: next tab" })
map("n", "<A-Left>", ":BufferLineCyclePrev<CR>", { desc = "Buffer: previous tab" })

map("n", "<leader>x", ":bdelete!<CR>", { desc = "Buffer: close current" })

--flash
map({ "n", "x", "o" }, "s", function()
	require("flash").jump()
end, { desc = "Flash: jump to location" })

map("o", "r", function()
	require("flash").remote()
end, { desc = "Flash: remote operator selection" })

map("c", "<C-s>", function()
	require("flash").toggle()
end, { desc = "Flash: toggle search mode" })

-- LSP
local function toggle_hover()
	for _, win in ipairs(vim.api.nvim_list_wins()) do
		local cfg = vim.api.nvim_win_get_config(win)

		if cfg.relative ~= "" then
			vim.api.nvim_win_close(win, true)
			return
		end
	end

	vim.lsp.buf.hover()
end
map("n", "K", toggle_hover, { desc = "Toggle hover documentation" })
map("n", "<leader>k", vim.diagnostic.open_float, { desc = "Line diagnostics" })
map("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
map("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
map("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
map("n", "go", vim.lsp.buf.type_definition, { desc = "Go to type definition" })
map("n", "gr", vim.lsp.buf.references, { desc = "Find references" })
map("n", "gs", vim.lsp.buf.signature_help, { desc = "Signature help" })
map("n", "<leader>rs", vim.lsp.buf.rename, { desc = "Rename symbol" })
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions" })

-- neo-tree
map("n", "<leader>n", ":Neotree toggle<CR>", { desc = "Toggle Neo-tree" })

map("n", "<Tab>", function()
	local current = vim.api.nvim_get_current_win()
	local neotree_win = nil
	for _, win in ipairs(vim.api.nvim_list_wins()) do
		local buf = vim.api.nvim_win_get_buf(win)
		local ft = vim.api.nvim_buf_get_option(buf, "filetype")

		if ft == "neo-tree" then
			neotree_win = win
			break
		end
	end
	if neotree_win then
		if current == neotree_win then
			vim.cmd("wincmd p")
		else
			vim.api.nvim_set_current_win(neotree_win)
		end
	end
end, { desc = "Switch between Neo-tree and file (if open)" })

-- telescope
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find Files" })
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Find Buffers" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Live Grep" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Help Tags" })
map("n", "<leader>fd", function()
	require("telescope.builtin").diagnostics()
end, { desc = "Diagnostics (Telescope)" })
	
-- Open a floating window showing the full diagnostic message under the cursor.
map("n", "<leader>e", function()
	vim.diagnostic.open_float(nil, {
		focus = false,
		border = "single", -- square borders
	})
end, { desc = "Show diagnostic in floating window" })

-- Compile and run current file based on filetype
map("n", "<leader>+", function()
	local ft = vim.bo.filetype
	local dir = vim.fn.expand("%:p:h")
	local cwd = vim.fn.getcwd()

	vim.cmd("cd " .. dir)
	if ft == "python" then
		vim.cmd("!python3 %")
	elseif ft == "java" then
		vim.cmd("!javac % && java %:r")
	elseif ft == "c" then
		vim.cmd("!gcc % -o %:r && ./%:r")
	end
	vim.cmd("cd " .. cwd)
end)
