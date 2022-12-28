local ng = require("neogen")
local opts = { noremap = true, silent = true }

ng.setup({
  enabled = true,
  snippet_engine = "luasnip",
  languages = {
    python = {
      template = {
        annotation_convention = "numpydoc",
      },
    },
  },
})

vim.api.nvim_set_keymap({ "i", "n" }, "<leader>ng", ":lua require('neogen').generate()<CR>", opts)
