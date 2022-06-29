-- if when healthchecking, cannot find 'tree-sitter' executable, run 'sudo npm -g install tree-sitter-cli'

-- https://zhuanlan.zhihu.com/p/441818052

require('nvim-treesitter.configs').setup {
  -- One of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = {'c', 'cpp', 'python', 'latex', 'lua', 'markdown'},

  -- Install languages synchronously (only applied to `ensure_installed`)
  sync_install = true,

  highlight = {
    enable = true,
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
    enable = false
  }
}

-- 开启 Folding
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
-- 默认不要折叠
-- https://stackoverflow.com/questions/8316139/how-to-set-the-default-to-unfolded-when-you-open-a-file
vim.opt.foldlevel = 99
