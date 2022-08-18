vim.cmd [[packadd packer.nvim]]

require('packer').startup(function()
	use 'wbthomason/packer.nvim'

	use {
		'nvim-treesitter/nvim-treesitter',
		'nvim-treesitter/playground',
		run = ':TSUpdate'
	}

	use 'shaunsingh/nord.nvim'

	use {
		'nvim-lualine/lualine.nvim',
		requires = {
			'kyazdani42/nvim-web-devicons', opt = true
		}
	}

	use {
		'kyazdani42/nvim-tree.lua',
		requires = {
			'kyazdani42/nvim-web-devicons', -- optional, for file icon
		}
	}

	use {
		'akinsho/bufferline.nvim',
		requires = {
			'kyazdani42/nvim-web-devicons'
		}
	}

	use {
		'numToStr/Comment.nvim',
	}

	use {
		'phaazon/hop.nvim',
		-- branch = 'v1', -- optional but strongly recommended
	}

	use {
		'neovim/nvim-lspconfig',
		'hrsh7th/nvim-cmp',
		'folke/lua-dev.nvim',
		'hrsh7th/cmp-nvim-lsp'
	}

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
end)

plugin_files = {'treesitter', 'nord', 'lualine', 'nvim-tree',
'bufferline', 'Comment', 'hop', 'lspconfig', 'cmp',
'toggleterm'}
for i = 1, #plugin_files do
	plugin = plugin_files[i]
	-- print('Load plugin config file: '..plugin)
	require('plugin_config/'..plugin)
end
