vim.cmd [[packadd packer.nvim]]

require('packer').startup(function()
	use 'wbthomason/packer.nvim'

	use {
		'nvim-treesitter/nvim-treesitter',
		'nvim-treesitter/playground',
		run = ':TSUpdate'
	}

	use 'shaunsingh/nord.nvim'

	use 'kyazdani42/nvim-web-devicons'

	use 'nvim-lualine/lualine.nvim'

	use 'kyazdani42/nvim-tree.lua'

	use 'akinsho/bufferline.nvim'

	use {
		'numToStr/Comment.nvim',
	}

	use {
		'phaazon/hop.nvim',
		branch = 'v2', -- optional but strongly recommended
	}

	use {
		'neovim/nvim-lspconfig',
		'hrsh7th/nvim-cmp',
		'hrsh7th/cmp-nvim-lua',
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-nvim-lsp-signature-help',
		'folke/neodev.nvim',
		'onsails/lspkind.nvim'
	}

	use({
		"L3MON4D3/LuaSnip",
		-- tag = "v<CurrentMajor>.*",
		requires = {
			'rafamadriz/friendly-snippets',
			'saadparwaiz1/cmp_luasnip'
		}
	})

	use {
		'nvim-telescope/telescope.nvim',
		requires = {
			'nvim-lua/plenary.nvim'
		}
	}

	use {
		"akinsho/toggleterm.nvim"
	}

	use {
		"jlanzarotta/bufexplorer"
	}

	use {
		'lervag/vimtex'
	}
end)

local plugin_files = {'treesitter', 'nord', 'lualine', 'nvim-tree',
	'bufferline', 'Comment', 'hop', 'lspconfig', 'cmp',
	'toggleterm', 'vimtex', 'luasnip'}
for i = 1, #plugin_files do
	local plugin = plugin_files[i]
	-- print('Load plugin config file: '..plugin)
	require('plugin_config/'..plugin)
end
