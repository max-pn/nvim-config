return {
	"benlubas/molten-nvim",
	version = "^1.0.0",
	build = ":UpdateRemotePlugins",

	init = function()
		vim.g.molten_auto_open_output = false
		vim.g.molten_image_provider = "image.nvim"
		vim.g.molten_wrap_output = true
		vim.g.molten_virt_text_output = true
		vim.g.molten_virt_lines_off_by_1 = true
		vim.g.molten_output_win_max_height = 20
	end,

	keys = {
		{ "<localleader>mi", "<cmd>MoltenInit<CR>", desc = "Molten init" },
		{ "<localleader>e", "<cmd>MoltenEvaluateOperator<CR>", desc = "Evaluate operator" },
		{ "<localleader>rr", "<cmd>MoltenReevaluateCell<CR>", desc = "Re-evaluate cell" },
		{ "<localleader>r", ":<C-u>MoltenEvaluateVisual<CR>gv", mode = "v", desc = "Evaluate visual" },
		{ "<localleader>os", "<cmd>noautocmd MoltenEnterOutput<CR>", desc = "Open output" },
		{ "<localleader>oh", "<cmd>MoltenHideOutput<CR>", desc = "Hide output" },
		{ "<localleader>md", "<cmd>MoltenDelete<CR>", desc = "Delete Molten cell" },
		{ "<localleader>mx", "<cmd>MoltenOpenInBrowser<CR>", desc = "Open HTML output in browser" },
	},
}
