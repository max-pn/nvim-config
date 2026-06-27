return {
	{
		"GCBallesteros/jupytext.nvim",
		lazy = false,
		opts = {
			style = "percent",
			output_extension = "py",
			force_ft = "python",
		},
	},

	{
		"GCBallesteros/NotebookNavigator.nvim",
		dependencies = {
			"benlubas/molten-nvim",
			"echasnovski/mini.comment",
			"echasnovski/mini.hipatterns",
		},
		event = "VeryLazy",
		keys = {
			{
				"]h",
				function()
					require("notebook-navigator").move_cell("d")
				end,
				desc = "Next notebook cell",
			},
			{
				"[h",
				function()
					require("notebook-navigator").move_cell("u")
				end,
				desc = "Previous notebook cell",
			},
			{
				"<leader>jc",
				function()
					require("notebook-navigator").run_cell()
				end,
				desc = "Run notebook cell",
			},
			{
				"<leader>jn",
				function()
					require("notebook-navigator").run_and_move()
				end,
				desc = "Run notebook cell and move",
			},
			{
				"<leader>ja",
				function()
					require("notebook-navigator").run_all_cells()
				end,
				desc = "Run all notebook cells",
			},
		},
		opts = {
			repl_provider = "molten",
			syntax_highlight = true,
			cell_highlight_group = "Folded",
			cell_markers = {
				python = "# %%",
			},
		},
	},

	{
		"echasnovski/mini.hipatterns",
		event = "VeryLazy",
		dependencies = {
			"GCBallesteros/NotebookNavigator.nvim",
		},
		opts = function()
			local nn = require("notebook-navigator")

			return {
				highlighters = {
					cells = nn.minihipatterns_spec,
				},
			}
		end,
	},
}
