--Welcome screen
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		if vim.fn.argc() == 0 and vim.fn.line2byte("$") == -1 then
			vim.cmd("Alpha")
			vim.cmd("bd 1")
		end
	end,
})

vim.api.nvim_create_autocmd("InsertEnter", {
	callback = function()
		vim.opt.relativenumber = false
	end,
})

vim.api.nvim_create_autocmd("InsertLeave", {
	callback = function()
		vim.opt.relativenumber = true
	end,
})

vim.api.nvim_create_user_command("Term", function()
	vim.cmd("vsplit")
	vim.cmd("wincmd l") -- move to the new right split
	vim.cmd("terminal")
end, {
	desc = "Open terminal in a vertical split",
})
