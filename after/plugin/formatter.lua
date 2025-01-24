require("mason").setup()
require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		javascript = { "prettier" },
		javascriptreact = { "prettier" },
		typescript = { "prettier" },
		typescriptreact = { "prettier" },
		json = { "prettier" },
		css = { "prettier" },
		python = { "black" },
		html = { "prettier" },
		sh = { "shfmt" },
		rust = { "rustfmt" },
		nix = { "nixpkgs_fmt" },
		["_"] = { "trim_whitespace" },
	},
	format_on_save = {
		timeout_ms = 500,
		lsp_format = "fallback",
	},
})
require("mason-conform").setup({
	-- must be installed through os
	ignore_install = { "stylua", "rustfmt" },
})
