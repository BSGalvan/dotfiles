-- Stolen from NvChad/NvChad/plugins/configs/others.lua
-- See also ray-x/lsp_signature.nvim's configuration section

require("lsp_signature").setup({
  bind = true,
  doc_lines = 2,
  fix_pos = true,
  hint_enable = true,
  hint_prefix = "🐧 ",
  hint_scheme = "String",
  hi_parameter = "Search",
  max_height = 22,
  max_width = 120, -- max_width of signature floating_window, line will be wrapped if exceed max_width
  handler_opts = {
    border = "rounded", -- double, rounded, single, shadow, none, or a table of borders
  },
  padding = "", -- character to pad on left and right of signature can be ' ', or '|'  etc
})
