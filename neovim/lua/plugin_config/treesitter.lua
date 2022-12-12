-- if when healthchecking, cannot find 'tree-sitter' executable, run 'sudo npm -g install tree-sitter-cli'

-- https://zhuanlan.zhihu.com/p/441818052

require('nvim-treesitter.configs').setup {
	-- One of "all", "maintained" (parsers with maintainers), or a list of languages
	ensure_installed = {'c', 'cpp', 'python', 'latex', 'lua', 'markdown', 'javascript'},

	-- Install languages synchronously (only applied to `ensure_installed`)
	sync_install = true,

	highlight = {
		enable = true,
		disable = function(lang, bufnr) -- Disable in large C++ buffers
			return lang == "latex" or lang == "cpp" and vim.api.nvim_buf_line_count(bufnr) > 50000
		end,
		additional_vim_regex_highlighting = false
	},

	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "gnn",
			node_incremental = "grn",
			scope_incremental = "grc",
			node_decremental = "grm"
		}
	},

	indent = {
		enable = true
	}
}

-- 开启 Folding
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldlevel = 1
