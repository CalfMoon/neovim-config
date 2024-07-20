require("catppuccin").setup({
	integrations = {
		mason = true,
		cmp = true,
	},

	transparent_background = false,
	custom_highlights = function(colors)
		return {
			FloatBorder = { fg = colors.green },
			CmpBorder = { fg = colors.green },
		}
	end,
})

vim.cmd("colorscheme catppuccin-mocha")
