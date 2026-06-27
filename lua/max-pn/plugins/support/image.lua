return {
	"3rd/image.nvim",
	build = false,
	opts = {
		backend = "kitty",
		processor = "magick_cli",
		integrations = {
			markdown = {
				enabled = true,
				filetypes = { "markdown", "quarto" },
				only_render_image_at_cursor = false,
				only_render_image_at_cursor_mode = "inline",
			},
		},
	},
}
