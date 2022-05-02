vim.cmd('packadd! dracula_pro')
vim.cmd('colorscheme dracula_pro_van_helsing')
vim.g.dracula_colorterm = 0

-- Fix colors mapping with nvim-treesitter, https://github.com/dracula/vim/blob/master/after/plugin/dracula.vim
-- # Misc
vim.cmd [[au VimEnter * hi! link TSPunctSpecial Special]]
-- Constants
vim.cmd [[au VimEnter * hi! link TSConstMacro Macro]]
vim.cmd [[au VimEnter * hi! link TSStringEscape Character]]
vim.cmd [[au VimEnter * hi! link TSSymbol DraculaPurple]]
vim.cmd [[au VimEnter * hi! link TSAnnotation DraculaYellow]]
vim.cmd [[au VimEnter * hi! link TSAttribute DraculaGreenItalic]]
-- Functions
vim.cmd [[au VimEnter * hi! link TSFuncBuiltin DraculaCyan]]
vim.cmd [[au VimEnter * hi! link TSFuncMacro Function]]
vim.cmd [[au VimEnter * hi! link TSParameter DraculaOrangeItalic]]
vim.cmd [[au VimEnter * hi! link TSParameterReference DraculaOrange]]
vim.cmd [[au VimEnter * hi! link TSField DraculaOrange]]
vim.cmd [[au VimEnter * hi! link TSConstructor DraculaCyan]]
-- Keywords
vim.cmd [[au VimEnter * hi! link TSLabel DraculaPurpleItalic]]
-- Variable
vim.cmd [[au VimEnter * hi! link TSVariableBuiltin DraculaPurpleItalic]]
-- Text
vim.cmd [[au VimEnter * hi! link TSStrong DraculaFgBold]]
vim.cmd [[au VimEnter * hi! link TSEmphasis DraculaFg]]
vim.cmd [[au VimEnter * hi! link TSUnderline Underlined]]
vim.cmd [[au VimEnter * hi! link TSTitle DraculaYellow]]
vim.cmd [[au VimEnter * hi! link TSLiteral DraculaYellow]]
vim.cmd [[au VimEnter * hi! link TSURI DraculaYellow]]
-- HTML and JSX tag attributes. By default, this group is linked to TSProperty,
-- which in turn links to Identifer (white).
vim.cmd [[au VimEnter * hi! link TSTagAttribute DraculaGreenItalic]]
