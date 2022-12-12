local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local bufopts = { noremap=true, silent=true, buffer=bufnr }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.keymap.set('n', '<Leader>gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', '<Leader>gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<leader>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, bufopts)
  vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'grr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, bufopts)
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, bufopts)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, bufopts)
  vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, bufopts)
  vim.keymap.set('n', '<C-f>', function() vim.lsp.buf.format { async = true } end, bufopts)

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'pyright', 'sumneko_lua', 'texlab', 'clangd', 'denols', 'jsonls' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end

-- lua
require("neodev").setup({
  -- add any options here, or leave empty to use the default settings
})

local lspconfig = require('lspconfig')
lspconfig.sumneko_lua.setup({
  settings = {
    Lua = {
      completion = {
        callSnippet = "Replace"
      }
    }
  }
})

-- pyright
require'lspconfig'.pyright.setup{
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 150,
  },
  settings = {
    python = {
      pythonPath = "python3"
    }
  }
}
