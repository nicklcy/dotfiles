require('Comment').setup()

Map('n', '<Leader>cc', '<CMD>lua require("Comment.api").toggle_current_linewise()<CR>')
Map('x', '<Leader>cc', '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>')
