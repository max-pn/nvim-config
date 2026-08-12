return {
	"mfussenegger/nvim-dap-python",
	ft = "python",
	dependencies = {
		"mfussenegger/nvim-dap",
	},
	config = function()
		local python_path = vim.fn.exepath("python3")

		if python_path == "" then
			python_path = vim.fn.exepath("python")
		end

		if python_path == "" then
			python_path = "python"
		end

		require("dap-python").setup(python_path)
	end,
}
