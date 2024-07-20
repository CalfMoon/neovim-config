require("mooney.remap")
require("mooney.packer")

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("catppuccin").setup({
	custom_highlights = function(colors)
		return {
			Comment = { fg = colors.flamingo },
			TabLineSel = { bg = colors.pink },
			CmpBorder = { fg = colors.surface2 },
			Pmenu = { bg = colors.none },
		}
	end,
})

vim.cmd("set number")
vim.cmd("set relativenumber")

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.ignorecase = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.cache/nvim/undotree"
vim.g.undotree_WindowLayout = 4
vim.g.undotree_SplitWidth = 35
vim.opt.undofile = true

vim.opt.scrolloff = 8

vim.o.guifont = "JetBrains Mono:h12" -- text below applies for VimScript
vim.opt.termguicolors = true

vim.g.terminal_color_0 = "#45475A"
vim.g.terminal_color_8 = "#585B70"

vim.g.terminal_color_1 = "#F38BA8"
vim.g.terminal_color_9 = "#F38BA8"

vim.g.terminal_color_2 = "#A6E3A1"
vim.g.terminal_color_10 = "#A6E3A1"

vim.g.terminal_color_3 = "#F9E2AF"
vim.g.terminal_color_11 = "#F9E2AF"

vim.g.terminal_color_4 = "#89B4FA"
vim.g.terminal_color_12 = "#89B4FA"

vim.g.terminal_color_5 = "#F5C2E7"
vim.g.terminal_color_13 = "#F5C2E7"

vim.g.terminal_color_6 = "#94E2D5"
vim.g.terminal_color_14 = "#94E2D5"

vim.g.terminal_color_7 = "#BAC2DE"
vim.g.terminal_color_15 = "#A6ADC8"
