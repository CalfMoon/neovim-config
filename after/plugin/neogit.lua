require("neogit").setup({
	graph_style = "kitty",
})

vim.keymap.set("n", "<leader>g", vim.cmd.Neogit)
