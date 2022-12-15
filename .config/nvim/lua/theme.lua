vim.cmd('packadd! dracula_pro')
vim.cmd('colorscheme dracula_pro_van_helsing')
vim.g.dracula_colorterm = 0

-- Fix colors mapping with nvim-treesitter, https://github.com/dracula/vim/blob/master/after/plugin/dracula.vim
local highlights = {
  -- Misc
  ["@punctuation.delimiter"] = "Delimiter",
  ["@punctuation.bracket"] = "DraculaFg",
  ["@punctuation.special"] = "Special",
  -- Constants
  ["@constant"] = "Constant",
  ["@constant.builtin"] = "Constant",
  ["@constant.macro"] = "Macro",
  ["@string.regex"] = "String",
  ["@string.escape"] = "Character",
  ["@symbol"] = "DraculaPurple",
  ["@annotation"] = "DraculaYellow",
  ["@attribute"] = "DraculaGreenItalic",
  ["@namespace"] = "Structure",
  -- Functions
  ["@function.builtin"] = "DraculaCyan",
  ["@funcion.macro"] = "Function",
  ["@parameter"] = "DraculaOrangeItalic",
  ["@parameter.reference"] = "DraculaOrange",
  ["@field"] = "DraculaOrange",
  ["@property"] = "DraculaFg",
  ["@constructor"] = "DraculaCyan",
  -- Keywords
  ["@label"] = "DraculaPurpleItalic",
  ["@keyword.function"] = "DraculaPink",
  ["@keyword.operator"] = "Operator",
  ["@exception"] = "DraculaPurple",
  -- Variable
  ["@variable"] = "DraculaFg",
  ["@variable.builtin"] = "DraculaPurpleItalic",
  -- Text
  ["@text"] = "DraculaFg",
  ["@text.strong"] = "DraculaFgBold",
  ["@text.emphasis"] = "DraculaFg",
  ["@text.underline"] = "Underlined",
  ["@text.title"] = "DraculaYellow",
  ["@text.literal"] = "DraculaYellow",
  ["@text.uri"] = "DraculaYellow",
  ["@text.diff.add"] = "DiffAdd",
  ["@text.diff.delete"] = "DiffDelete",
  -- Tags",
  ["@tag"] = "DraculaCyan",
  ["@tag.delimiter"] = "DraculaFg",
  -- HTML and JSX tag attributes. By default, this group is linked to TSProperty,
  -- which in turn links to Identifer (white).
  ["@tag.attribute"] = "DraculaGreenItalic",
}

for k, v in pairs(highlights) do
  vim.api.nvim_set_hl(0, k, { link = v, default = true })
end
