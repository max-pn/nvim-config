return {
	{
		"kevinhwang91/nvim-ufo",
		dependencies = {
			"kevinhwang91/promise-async",
		},
		event = "BufReadPost",
		init = function()
			vim.o.foldcolumn = "1"
			vim.o.foldlevel = 99
			vim.o.foldlevelstart = 99
			vim.o.foldenable = true
		end,
		opts = {
			provider_selector = function(_, filetype, buftype)
				if buftype ~= "" then
					return ""
				end

				local ft_map = {
					typescript = { "lsp", "treesitter" },
					typescriptreact = { "lsp", "treesitter" },
					javascript = { "lsp", "treesitter" },
					javascriptreact = { "lsp", "treesitter" },
				}

				return ft_map[filetype] or { "treesitter", "indent" }
			end,
		},
	},
}
