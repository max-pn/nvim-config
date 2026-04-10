return {
	"TheLeoP/powershell.nvim",
	---@type powershell.user_config
	opts = {
		bundle_path = "~/.local/share/PowerShellEditorServices",
		settings = {
			powershell = {
				codeFormatting = {
					preset = "OTBS",
				},
			},
		},
	},
}
