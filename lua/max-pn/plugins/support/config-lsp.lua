return {
	"https://git.myzel394.app/Myzel394/config-lsp.nvim",
	opts = {
		-- Everything related to the executable
		-- You can let config-lsp.nvim automatically download
		-- the config-lsp executable for you, or provide your own path.
		--
		-- config-lsp.nvim will try to find config-lsp in the following order:
		-- 1. If `path` is not nil, try `path`
		-- 2. Try simply calling `config-lsp` (you'll need to add `config-lsp` to your `$PATH` for that to work)
		-- 3. Try the `config-lsp` binary inside the specified `executable.download_folder`
		-- 4. If `config-lsp` is still not found, config-lsp.nvim will automatically download the latest release
		--    and place it inside your `executable.download_folder`
		executable = {
			-- The path to look for `config-lsp`
			path = nil,
			-- What args to pass to `config-lsp`
			-- See https://github.com/Myzel394/config-lsp#configuration for available args
			args = {
				"--no-undetectable-errors",
			},
			-- Where to download the `config-lsp` binary if it's not found
			download_folder = vim.fn.stdpath("data") .. "/config-lsp/bin",
		},
		-- If true, config-lsp.nvim will automatically set up the lspconfig server for you
		inject_lsp = true,
		-- If true, config-lsp.nvim will add the filetypes it knows about to neovim
		add_filetypes = true,
	},
}
