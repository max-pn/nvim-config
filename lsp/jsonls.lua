---@brief
--- https://github.com/hrsh7th/vscode-langservers-extracted
---
--- vscode-json-language-server, a language server for JSON and JSON schema.
---@type vim.lsp.Config
return {
  cmd = { 'vscode-json-language-server', '--stdio' },
  filetypes = { 'json', 'jsonc' },
  init_options = {
    provideFormatter = true,
  },
  -- Simple root detection; good enough for most projects
  root_markers = { '.git' },
}
