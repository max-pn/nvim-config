return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				-- filetype = { "formatter1", "formatter2" },
				bib = { "latexindent" },
				javascript = { "prettierd", "prettier" },
				javascriptreact = { "prettierd", "prettier" },
				latex = { "latexindent" },
				lua = { "stylua" },
				markdown = { "prettierd", "prettier" },
				-- nix = { "nixfmt" }, -- Configured in vim.lsp.nixd.settings
				plaintex = { "latexindent" },
				typescript = { "prettierd", "prettier" },
				tex = { "latexindent" },
				typescriptreact = { "prettierd", "prettier" },
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
