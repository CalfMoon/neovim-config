require("neo-tree").setup({
	window = {
		position = "current",
	},
	hijack_netrw_behavior = "open_current",
})

vim.keymap.set("n", "<leader>t", function()
	vim.cmd("Neotree")
end)
vim.keymap.set("n", "<leader>T", function()
	vim.cmd("Neotree toggle position=left")
end)
