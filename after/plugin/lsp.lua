local lsp_zero = require("lsp-zero")

lsp_zero.on_attach(function(client, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	lsp_zero.default_keymaps({ buffer = bufnr })
end)

vim.diagnostic.config({
	virtual_text = false,
})

-- here you can setup the language servers
require("mason").setup({})

-- lsp
require("mason-lspconfig").setup({
	ensure_installed = {
		"tsserver",
		"emmet_ls",
		"cssls",
		"css_variables",
		"pyright",
		"html",
		"lua_ls",
		"bashls",
		"nil_ls",
	},
	handlers = {
		function()
			local lspconfig = require("lspconfig")
			lspconfig.tsserver.setup({})
			lspconfig.cssls.setup({})
			lspconfig.html.setup({})
			lspconfig.emmet_ls.setup({
				filetype = { "html" },
			})
			lspconfig.css_variables.setup({})
			lspconfig.rust_analyzer.setup({})
			lspconfig.pyright.setup({ settings = { python = { analysis = { typeCheckingMode = "off" } } } })
			lspconfig.lua_ls.setup({ settings = { Lua = { diagnostics = { globals = { "vim" } } } } })
			lspconfig.bashls.setup({})
			lspconfig.nil_ls.setup({})
		end,
	},
})

--formatter
require("formatter").setup({
	filetype = {
		lua = { require("formatter.filetypes.lua").stylua },
		javascript = { require("formatter.filetypes.javascript").prettier },
		javascriptreact = { require("formatter.filetypes.javascriptreact").prettier },
		css = { require("formatter.filetypes.css").prettier },
		python = { require("formatter.filetypes.python").black },
		html = { require("formatter.filetypes.html").htmlbeautifier },
		rust = { require("formatter.filetypes.rust").rustfmt },
		nix = { require("formatter.filetypes.nix").nixpkgs_fmt },

		["*"] = { require("formatter.filetypes.any").remove_trailing_whitespace },
	},
})

require("nvim-ts-autotag").setup({
	opts = {
		enable_close = false, -- Auto close tags
		enable_rename = true, -- Auto rename pairs of tags
		enable_close_on_slash = false, -- Auto close on trailing </
	},
})

vim.api.nvim_create_augroup("__formatter__", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
	group = "__formatter__",
	command = ":FormatWrite",
})

-- linter
-- require("mason-nvim-lint").setup({
-- 	ensure_installed = { "flake8" },
-- 	automatic_installation = false,
-- })

-- require("lint").linters_by_ft = {
-- 	python = { "flake8" },
-- 	= { "flake8" },
-- }
--
-- vim.api.nvim_create_autocmd({ "BufWritePost" }, {
-- 	callback = function()
-- 		require("lint").try_lint()
-- 	end,
-- })

-- autocomplete
local cmp = require("cmp")
cmp.setup({
	sources = { { name = "nvim_lsp" } },
	mapping = cmp.mapping.preset.insert({
		["<Tab>"] = cmp.mapping.confirm({ select = true }),
		["<C-k>"] = cmp.mapping.select_prev_item(),
		["<C-j>"] = cmp.mapping.select_next_item(),
	}),
})
