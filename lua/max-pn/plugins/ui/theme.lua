return {
	"olimorris/onedarkpro.nvim",
	priority = 1000, -- Ensure it loads first

	config = function(_, opts)
		require("onedarkpro").setup(opts)
		vim.cmd.colorscheme("onedark")

		-- MANUAL ADJUSTMENTS
		-- NVIM-TREE
		vim.cmd([[
      highlight NvimTreeNormal guibg=#22252a
      highlight NvimTreeNormalNC guibg=#22252a
    ]]) -- change background

		vim.cmd([[
      highlight NvimTreeFolderName guifg=#acb2be
      highlight NvimTreeFolderIcon guifg=#acb2be
      highlight NvimTreeOpenedFolderName guifg=#acb2be
      highlight NvimTreeEmptyFolderName guifg=#acb2be
      highlight NvimTreeRootFolder guifg=#acb2be
    ]]) -- change directory color

		-- BUFFERLINE
		vim.cmd([[
      highlight BufferLineFill guibg=#22252a
    ]]) -- change background
	end,
}
