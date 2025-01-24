vim.diagnostic.config({ virtual_text = false })

vim.keymap.set("n", "tl", "<cmd>lua vim.diagnostic.open_float()<cr>")
vim.keymap.set("n", "tk", "<cmd>lua vim.diagnostic.goto_prev()<cr>")
vim.keymap.set("n", "tj", "<cmd>lua vim.diagnostic.goto_next()<cr>")
vim.api.nvim_create_autocmd("LspAttach", {
	desc = "LSP actions",
	callback = function(event)
		local opts = { buffer = event.buf }
		vim.keymap.set("n", "th", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
		vim.keymap.set("n", "tr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
		vim.keymap.set("n", "tR", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
		vim.keymap.set("n", "td", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
	end,
})

local lsp_zero = require("lsp-zero")
lsp_zero.on_attach(function(client, bufnr) end)

-- here you can setup the language servers
require("mason").setup({})

-- lsp
require("mason-lspconfig").setup({
	ensure_installed = {
		"ts_ls",
		"cssls",
		"css_variables",
		"html",
		"jsonls",
		"emmet_ls",
		"pyright",
		-- lua and rust_analyzer has to be installed in os level in nixos
		"bashls",
		"nil_ls",
	},

	handlers = {
		function()
			local lspconfig = require("lspconfig")
			lspconfig.ts_ls.setup({})
			lspconfig.cssls.setup({})
			lspconfig.html.setup({})
			lspconfig.jsonls.setup({})
			lspconfig.emmet_ls.setup({
				filetype = { "html" },
			})
			lspconfig.css_variables.setup({})
			lspconfig.pyright.setup({ settings = { python = { analysis = { typeCheckingMode = "off" } } } })
			lspconfig.lua_ls.setup({ settings = { Lua = { diagnostics = { globals = { "vim" } } } } })
			lspconfig.bashls.setup({})
			lspconfig.nil_ls.setup({})
		end,
	},
})

vim.g.rustaceanvim = {
	server = {
		default_settings = {
			["rust-analyzer"] = {
				procMacro = {
					enable = true,
				},
				diagnostics = {
					enable = true,
					disabled = { "macro-error" },
				},
			},
		},
	},
}

-- autocomplete
local cmp = require("cmp")
local lspkind = require("lspkind")
cmp.setup({
	sources = { { name = "nvim_lsp" }, { name = "luasnip" } },
	mapping = cmp.mapping.preset.insert({
		["<Tab>"] = cmp.mapping.confirm({ select = true }),
		["<C-k>"] = cmp.mapping.select_prev_item(),
		["<C-j>"] = cmp.mapping.select_next_item(),
	}),
	formatting = {
		format = lspkind.cmp_format({
			mode = "symbol_text",
			ellipsis_char = "...",
			maxwidth = 40,
		}),
	},

	window = {
		completion = {
			border = "rounded",
			winhighlight = "Normal:Pmenu,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
			col_offset = -3,
		},
		documentation = {
			border = "rounded",
			winhighlight = "Normal:Pmenu,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
		},
	},
})

require("nvim-ts-autotag").setup({
	opts = {
		enable_close = false, -- Auto close tags
		enable_rename = true, -- Auto rename pairs of tags
		enable_close_on_slash = false, -- Auto close on trailing </
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
