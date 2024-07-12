require("toggleterm").setup({
	open_mapping = [[<C-t>]],
})

vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]])
vim.keymap.set("t", "<C-w><C-w>", [[<C-\><C-n><C-w><C-w>]])
