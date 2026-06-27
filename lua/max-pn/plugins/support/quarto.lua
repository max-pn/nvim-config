return {
	"quarto-dev/quarto-nvim",
	ft = { "quarto", "markdown" },
	dependencies = {
		"jmbuhr/otter.nvim",
		"neovim/nvim-lspconfig",
	},
	config = function()
		local quarto = require("quarto")

		quarto.setup({
			lspFeatures = {
				languages = { "python", "r", "julia", "bash" },
				chunks = "all",
				diagnostics = {
					enabled = true,
					triggers = { "BufWritePost" },
				},
				completion = {
					enabled = true,
				},
			},
			codeRunner = {
				enabled = true,
				default_method = "molten",
			},
		})

		local runner = require("quarto.runner")

		vim.keymap.set("n", "<localleader>rc", runner.run_cell, { desc = "Run cell", silent = true })
		vim.keymap.set("n", "<localleader>ra", runner.run_above, { desc = "Run above", silent = true })
		vim.keymap.set("n", "<localleader>rA", runner.run_all, { desc = "Run all", silent = true })
		vim.keymap.set("n", "<localleader>rl", runner.run_line, { desc = "Run line", silent = true })
		vim.keymap.set("v", "<localleader>r", runner.run_range, { desc = "Run range", silent = true })
	end,
}
