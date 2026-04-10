return {
	"lervag/vimtex",
	lazy = false,
	init = function()
		vim.g.vimtex_view_method = "skim"
		vim.g.vimtex_compiler_latexmk = {
			engine = "-xelatex",
			options = {
				"-pdf",
				"-shell-escape",
				"-verbose",
				"-file-line-error",
				"-synctex=1",
				"-interaction=nonstopmode",
			},
		}

		vim.g.vimtex_syntax_conceal_disable = true

		vim.g.vimtex_compiler_latexmk_engines = {
			_ = "-xelatex",
		}
	end,
}
