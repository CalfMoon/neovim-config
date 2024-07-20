vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")
	-- theme
	use({
		"catppuccin/nvim",
		as = "catppuccin",
	})
	-- fuzzy finder
	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-telescope/telescope-fzf-native.nvim", "nvim-lua/plenary.nvim" } },
	})
	-- syntax highlighter
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate", requires = { "HiPhish/rainbow-delimiters.nvim" } })
	-- show colors
	use({ "brenoprata10/nvim-highlight-colors" })
	-- bracket paring
	use({
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})
	-- comment your code
	use({ "numToStr/Comment.nvim" })
	-- undo properly
	use({ "mbbill/undotree" })
	-- proper word motion
	use({ "chaoren/vim-wordmotion" })
	-- file manager
	use({
		"nvim-neo-tree/neo-tree.nvim",
		requires = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", "MunifTanjim/nui.nvim" },
	})
	-- session manager
	use({ "Shatur/neovim-session-manager" })
	-- status line
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "nvim-tree/nvim-web-devicons", opt = true },
	})
	-- terminal manager
	use({ "akinsho/toggleterm.nvim" })
	-- lsp stuff
	use({
		"VonHeikemen/lsp-zero.nvim",
		"williamboman/mason.nvim",

		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",

		-- "mfussenegger/nvim-lint",
		-- "rshkarin/mason-nvim-lint",

		"mhartington/formatter.nvim",
		"windwp/nvim-ts-autotag",

		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-nvim-lsp",

		"L3MON4D3/LuaSnip",
	})
	-- git
	use({ "NeogitOrg/neogit" })
	-- scroll gap at end
	use({ "Aasim-A/scrollEOF.nvim" })
	-- github
	use({
		"pwntester/octo.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("octo").setup()
		end,
	})
end)
