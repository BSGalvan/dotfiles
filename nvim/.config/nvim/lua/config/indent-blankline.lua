--[[ if not pcall(require, "indent-blankline") then
  return
end ]]

require("indent_blankline").setup({
  buftype_exclude = { "terminal" },
  char_list = { "|", "¦", "┆", "┊" },
  show_current_context = true,
  use_treesitter = true,
  filetype_exclude = { "packer" },
  context_patterns = {
    "class",
    "function",
    "method",
    "block",
    "list_literal",
    "selector",
    "^if",
    "^table",
    "if_statement",
    "while",
    "for",
  },
})
