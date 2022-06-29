-- https://oroques.dev/notes/neovim-init/
function Map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

vim.g.mapleader = ' '

Map('i', 'jk', '<Esc>')
Map('i', 'bbb', '{<Enter>}<Esc>O')
Map('n', '<Leader>w', ':w<CR>')
Map('n', '<Leader>tbn', ':tabnext<CR>')
Map('n', '<Leader>tbp', ':tabprev<CR>')
Map('n', '<Leader>bn', ':bnext<CR>')
Map('n', '<Leader>bp', ':bprev<CR>')
Map('n', '<Leader>bd', ':bdelete<CR>')
Map('n', '<Leader>srn', ':set relativenumber<CR>')
