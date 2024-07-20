vim.g.mapleader = " "

vim.keymap.set("n", "<leader>k", vim.cmd.bd)
vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("n", "<C-/>", vim.cmd.noh)

-- center cursor
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- proper copy and paste
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')

vim.keymap.set("n", "<leader>p", '"+p')
vim.keymap.set("n", "<leader>P", '"+P')
vim.keymap.set("v", "<leader>p", '"+p')
vim.keymap.set("v", "<leader>P", '"+P')

-- paste in to void register
vim.keymap.set("x", "p", '"_dP')

vim.keymap.set("v", "<leader>d", '"_d')
vim.keymap.set("n", "<leader>d", '"_d')
