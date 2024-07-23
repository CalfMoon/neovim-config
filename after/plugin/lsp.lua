vim.diagnostic.config({ virtual_text = false })

vim.keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>")
vim.keymap.set("n", "gj", "<cmd>lua vim.diagnostic.goto_prev()<cr>")
vim.keymap.set("n", "gk", "<cmd>lua vim.diagnostic.goto_next()<cr>")
vim.api.nvim_create_autocmd("LspAttach", {
	desc = "LSP actions",
	callback = function(event)
		local opts = { buffer = event.buf }
		vim.keymap.set("n", "gh", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
		vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
		vim.keymap.set("n", "gR", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
		vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
	end,
})

-- here you can setup the language servers
require("mason").setup({})

-- lsp
require("mason-lspconfig").setup({
	ensure_installed = { "css_variables" },

	handlers = {
		function()
			local lspconfig = require("lspconfig")
			lspconfig.tsserver.setup({})
			lspconfig.cssls.setup({})
			lspconfig.html.setup({})
			lspconfig.jsonls.setup({})
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
		json = { require("formatter.filetypes.json").prettier },
		css = { require("formatter.filetypes.css").prettier },
		python = { require("formatter.filetypes.python").black },
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

-- autocomplete
local cmp = require("cmp")
cmp.setup({
	sources = { { name = "nvim_lsp" } },
	mapping = cmp.mapping.preset.insert({
		["<Tab>"] = cmp.mapping.confirm({ select = false }),
		["<C-k>"] = cmp.mapping.select_prev_item(),
		["<C-j>"] = cmp.mapping.select_next_item(),
	}),

	window = {
		completion = {
			border = "rounded",
			winhighlight = "Normal:Pmenu,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
		},
		documentation = {
			border = "rounded",
			winhighlight = "Normal:Pmenu,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
		},
	},
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
--
require("nvim-ts-autotag").setup({
	opts = {
		enable_close = false, -- Auto close tags
		enable_rename = true, -- Auto rename pairs of tags
		enable_close_on_slash = false, -- Auto close on trailing </
	},
})
