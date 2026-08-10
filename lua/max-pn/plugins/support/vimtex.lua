return {
	"lervag/vimtex",
	lazy = false,
	init = function()
		if vim.fn.executable("skim") == 1 then
			vim.g.vimtex_view_method = "skim"
		elseif vim.fn.executable("zathura") == 1 then
			vim.g.vimtex_view_method = "zathura"
		end
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
