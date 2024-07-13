require("lualine").setup({
	options = {
		theme = "catppuccin",
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "filename" },
		lualine_c = { "" },

		lualine_x = { "" },
		lualine_y = { "filetype" },
		lualine_z = { "progress", "location" },
	},
})
