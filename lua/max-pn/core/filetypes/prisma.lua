vim.api.nvim_create_autocmd("FileType", {
	pattern = "prisma",
	callback = function()
		pcall(vim.treesitter.start)
	end,
})
