local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	{
		"kndndrj/nvim-dbee",
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
		build = function()
			-- Install tries to automatically detect the install method.
			-- if it fails, try calling it with one of these parameters:
			--    "curl", "wget", "bitsadmin", "go"
			require("dbee").install()
		end,
		config = function()
			require("dbee").setup(--[[optional config]])
		end,
	},
	-- theme
	{ "catppuccin/nvim", name = "catppuccin" },
	-- syntax highlighter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		dependencies = { "HiPhish/rainbow-delimiters.nvim" },
	},
	-- status line
	{ "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },
	-- file manager
	{
		"nvim-neo-tree/neo-tree.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", "MunifTanjim/nui.nvim" },
	},
	-- fuzzy finder
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-telescope/telescope-ui-select.nvim",
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
	},
	-- session manager
	"Shatur/neovim-session-manager",
	-- undo properly
	"mbbill/undotree",
	-- terminal manager
	"akinsho/toggleterm.nvim",
	-- git
	{
		"NeogitOrg/neogit",
		{ "lewis6991/gitsigns.nvim", config = true },
		dependencies = { "nvim-lua/plenary.nvim", "sindrets/diffview.nvim", "nvim-telescope/telescope.nvim" },
	},
	-- github
	{
		"pwntester/octo.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim", "nvim-tree/nvim-web-devicons" },
	},
	-- bracket paring
	{ "windwp/nvim-autopairs", event = "InsertEnter", config = true },
	-- comment your code
	"numToStr/Comment.nvim",
	-- MarkDown Preview
	{ "toppair/peek.nvim", event = "VeryLazy", build = "deno task --quiet build:fast" },
	-- proper word motion
	"chaoren/vim-wordmotion",
	-- scroll gap at end
	"Aasim-A/scrollEOF.nvim",

	-- ide stuff
	{
		"williamboman/mason.nvim",
		"mrcjkb/rustaceanvim",
		-- lsp and autocomplete
		{
			"VonHeikemen/lsp-zero.nvim",
			"williamboman/mason-lspconfig.nvim",
			"neovim/nvim-lspconfig",

			"windwp/nvim-ts-autotag",

			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-nvim-lsp",
			"L3MON4D3/LuaSnip",
			"onsails/lspkind.nvim",
		},
		-- debugger
		{
			"mfussenegger/nvim-dap",
			"jay-babu/mason-nvim-dap.nvim",
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
			{
				"microsoft/vscode-js-debug",
				build = "npm install --legacy-peer-deps && npx gulp dapDebugServer",
			},
		},
		-- linting
		{
			"mfussenegger/nvim-lint",
			-- "rshkarin/mason-nvim-lint",
		},
		-- formatter
		{
			"mhartington/formatter.nvim",
			"stevearc/conform.nvim",
			"zapling/mason-conform.nvim",
		},
	},
}

require("lazy").setup(plugins, {})
