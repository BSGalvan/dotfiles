local map_key = vim.api.nvim_set_keymap
local opts = { noremap = true }

require("gitsigns").setup({
  signcolumn = false, -- Toggle with `:Gitsigns toggle_signs`
  current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`

  watch_gitdir = {
    interval = 5000,
  },

  current_line_blame_formatter_opts = {
    relative_time = true
  },

  preview_config = {
    -- Options passed to nvim_open_win
    border = "rounded",
  },
})

-- Gitsigns.nvim specific mappings
map_key("n", "<F6>", "<cmd>Gitsigns toggle_signs<CR>", opts)
