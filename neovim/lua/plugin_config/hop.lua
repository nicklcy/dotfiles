require'hop'.setup()

Map('n', '<Leader><Leader>w', '<cmd>HopWord<cr>')
Map('n', '<Leader><Leader>l', '<cmd>HopLine<cr>')
Map('n', '<Leader>f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>")
Map('n', '<Leader>F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>")
