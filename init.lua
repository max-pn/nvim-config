--- Neovim Configuration
--- @author max-pn
--- @date 2025-12-06
---
--- This configuration was last updated for Neovim 0.11.x
--- key features:
--- - Use of new Built-in LSP configuration
--- - structured, modular plugins setup using 'lazy.nvim'

require("max-pn.core") -- general IDE settings
require("max-pn.lazy") -- plugins
require("max-pn.lsp")  -- built-in LSP configuration
