vim.g.tex_flavor='latex'

vim.g.vimtex_view_general_viewer = 'zathura'
vim.g.vimtex_view_method = 'zathura'

vim.g.vimtex_fold_enabled = true
vim.g.vimtex_format_enabled = true

vim.g.vimtex_compiler_latexmk = {
	build_dir = 'build/',
	executable = 'latexmk',
	options = {
	"-xelatex",
	"-shell-escape",
	'-verbose',
	'-file-line-error',
	'-synctex=1',
	'-interaction=nonstopmode'
 }
}

vim.g.vimtex_compiler_latexmk_engines = {
	_= '-xelatex',
}
