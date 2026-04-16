--- Neovim Configuration
--- @author max-pn
--- @date 2025-12-06

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup(
  {
    -- move lazy lockfile as ~/.config/nvim/ is managed by home-manager
    lockfile = vim.fn.stdpath("state") .. "/lazy-lock.json",

    -- plugins structure
    { import = "max-pn.plugins" },         -- main plugins file (meant for general dependencies)
    { import = "max-pn.plugins.editor" },  -- editor enhancements like treesitter, autocomplete, formatting, etc.
    -- TODO: { import = "max-pn.plugins.debugging" }, -- dap-implementation
    { import = "max-pn.plugins.git" },     -- git related plugins
    { import = "max-pn.plugins.ui" },      -- ui enhancements like statusline, bufferline, filetree, etc.
    { import = "max-pn.plugins.support" }, -- support plugins for various languages/tools
    -- TEST: { import = "max-pn.plugins.langs" },  -- language specific plugins
  },
  {
    checker = {
      enabled = true,
      notify = false,
    },
    change_detection = {
      notify = false,
    },
  }
)
