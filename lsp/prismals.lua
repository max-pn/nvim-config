---@link https://github.com/neovim/nvim-lspconfig/blob/master/lsp/prismals.lua
---
---@brief
---
--- Language Server for the Prisma JavaScript and TypeScript ORM
---
--- `@prisma/language-server` can be installed via npm
--- ```sh
--- npm install -g @prisma/language-server
--- ```

---@type vim.lsp.Config
return {
	cmd = function(dispatchers)
		local local_cmd = vim.fs.joinpath(vim.fn.getcwd(), "node_modules", ".bin", "prisma-language-server")

		local cmd = vim.uv.fs_stat(local_cmd) and { local_cmd, "--stdio" } or { "prisma-language-server", "--stdio" }

		return vim.lsp.rpc.start(cmd, dispatchers)
	end,

	filetypes = { "prisma" },

	root_markers = {
		"schema.prisma",
		"prisma.config.ts",
		"prisma.config.js",
		"package.json",
		".git",
	},

	settings = {
		prisma = {
			prismaFmtBinPath = "",
		},
	},
}
