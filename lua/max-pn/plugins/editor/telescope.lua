return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
		"folke/todo-comments.nvim",
		"nvim-telescope/telescope-bibtex.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local transform_mod = require("telescope.actions.mt").transform_mod

		local trouble = require("trouble")
		local trouble_telescope = require("trouble.sources.telescope")

		-- or create your custom action
		local custom_actions = transform_mod({
			open_trouble_qflist = function(prompt_bufnr)
				trouble.toggle("quickfix")
			end,
		})

		telescope.setup({
			defaults = {
				path_display = { "smart" },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						["<C-q>"] = actions.send_selected_to_qflist + custom_actions.open_trouble_qflist,
						["<C-t>"] = trouble_telescope.open,
					},
				},
			},
			extensions = {
				bibtex = {
					-- Reads \addbibresource{...} from the current tex file
					context = true,

					-- Reads \addbibresource{...} from subdirectories as well
					context_fallback = true,
					depth = 3,

					-- What fields Telescope searches through
					search_keys = { "author", "year", "title", "label" },

					-- Optional fallback if context doesn’t find the project's bib file
					-- global_files = { vim.fn.expand("~/Documents/references.bib") },
				},
			},
		})

		telescope.load_extension("fzf")
		telescope.load_extension("bibtex")

		-- set keymaps
		local keymap = vim.keymap -- for conciseness
		local builtin = require("telescope.builtin")
		keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Fuzzy find files in cwd" })
		keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Fuzzy find recent files" })
		keymap.set("n", "<leader>fs", builtin.live_grep, { desc = "Find string in cwd" })
		keymap.set("n", "<leader>fc", builtin.grep_string, { desc = "Find string under cursor in cwd" })
		keymap.set("n", "<leader>ft", "<cmd>TodoTelescope keywords=TODO<cr>", { desc = "Find todos" })
		keymap.set("n", "<leader>fn", "<cmd>TodoTelescope<cr>", { desc = "Find annotations" })
		keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Fuzzy find buffers" })
		keymap.set("n", "<leader>fx", builtin.diagnostics, { desc = "Find errors and warnings" })
		keymap.set("n", "<leader>c", "<cmd>Telescope bibtex<cr>", { desc = "Fuzzy find citations" })
	end,
}
