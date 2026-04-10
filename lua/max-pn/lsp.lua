-- enable lsps here
-- lsps are configured in ./lsp/<lsp_name>.lua

-- c
vim.lsp.enable("clangd")

-- cmake
vim.lsp.enable("cmake")

-- latex (grammar-checking)
vim.lsp.enable("ltex-ls-plus")

-- javascript, typescript, jsx, tsx
vim.lsp.enable("ts_ls")

-- json, jsonc
vim.lsp.enable("jsonls")

-- latex
vim.lsp.enable("texlab")

-- lua
vim.lsp.enable("lua_ls")

-- markdown
vim.lsp.enable("marksman")

-- nix
vim.lsp.enable("nixd")

-- prisma orm
vim.lsp.enable("prismals")

-- pyright
vim.lsp.enable("pyright")

-- tailwind
vim.lsp.enable("tailwindcss")

-- enable lsp keymaps
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		local opts = { buffer = ev.buf, silent = true }

		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "gf", vim.lsp.buf.code_action, opts)

		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)
	end,
})

-- enable lsp diagnostics
vim.diagnostic.config({
	-- use the default configuration
	-- virtual_lines = true

	-- alternatively, customize specific options
	virtual_lines = {
		-- Only show virtual line diagnostics for the current cursor line
		current_line = true,
	},
})
