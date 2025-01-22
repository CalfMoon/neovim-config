require("formatter").setup({
	filetype = {
		lua = { require("formatter.filetypes.lua").stylua },
		javascript = { require("formatter.filetypes.javascript").prettier },
		javascriptreact = { require("formatter.filetypes.javascriptreact").prettier },
		typescript = { require("formatter.filetypes.javascript").prettier },
		typescriptreact = { require("formatter.filetypes.javascriptreact").prettier },
		json = { require("formatter.filetypes.json").prettier },
		css = { require("formatter.filetypes.css").prettier },
		python = { require("formatter.filetypes.python").prettier },
		html = { require("formatter.filetypes.html").htmlbeautifier },
		sh = { require("formatter.filetypes.sh").shfmt },
		rust = { require("formatter.filetypes.rust").rustfmt },
		nix = { require("formatter.filetypes.nix").nixpkgs_fmt },

		["*"] = { require("formatter.filetypes.any").remove_trailing_whitespace },
	},
})
vim.api.nvim_create_augroup("__formatter__", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
	group = "__formatter__",
	command = ":FormatWrite",
})
