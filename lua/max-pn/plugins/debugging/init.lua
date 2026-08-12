return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"rcarriga/nvim-dap-ui",
		"theHamsta/nvim-dap-virtual-text",
		"nvim-telescope/telescope-dap.nvim",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		vim.fn.sign_define("DapBreakpoint", { text = "B", texthl = "DiagnosticSignError" })
		vim.fn.sign_define("DapBreakpointCondition", { text = "C", texthl = "DiagnosticSignWarn" })
		vim.fn.sign_define("DapBreakpointRejected", { text = "R", texthl = "DiagnosticSignError" })
		vim.fn.sign_define("DapLogPoint", { text = "L", texthl = "DiagnosticSignInfo" })
		vim.fn.sign_define("DapStopped", { text = "X", texthl = "DiagnosticSignWarn", linehl = "Visual" })

		dapui.setup()
		require("nvim-dap-virtual-text").setup()

		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated["dapui_config"] = function()
			dapui.close()
		end
		dap.listeners.before.event_exited["dapui_config"] = function()
			dapui.close()
		end

		pcall(require("telescope").load_extension, "dap")
	end,
}
