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
