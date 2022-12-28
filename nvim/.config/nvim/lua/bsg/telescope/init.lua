local map_key = vim.api.nvim_set_keymap
local opts = { noremap = true }

require("telescope").setup({
  defaults = {
    -- Configure settings common to all pickers, sorters and previewers
    winblend = 5,
    prompt_prefix = "τ: ",
    selection_caret = ">> ",
  },
  extensions = {
    file_browser = {
      theme = "ivy",
      hidden = true,
    },
  },
})

require("telescope").load_extension("fzf")
require("telescope").load_extension("file_browser")

-- Telescope.nvim specific mappings
map_key("n", "<Space>fb", "<cmd>Telescope buffers<CR>", opts)
map_key(
  "n",
  "<Space>fd",
  "<cmd>lua require('telescope.builtin').file_browser({cwd = '/home/bsg/dotfiles', hidden = true})<CR>",
  opts
)
map_key("n", "<Space>fl", "<cmd>Telescope live_grep<CR>", opts)
map_key("n", "<Space>fe", "<cmd>lua require('telescope').extensions.file_browser.file_browser()<CR>", opts)
map_key("n", "<Space>fh", "<cmd>Telescope help_tags<CR>", opts)
map_key("n", "<Space>fo", "<cmd>Telescope oldfiles<CR>", opts)
map_key("n", "<Space>fq", "<cmd>Telescope quickfix<CR>", opts)
map_key("n", "<Space>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", opts)
map_key("n", "<Space>t", "<cmd>Telescope<CR>", opts)
map_key(
  "n",
  "<Space>wk",
  "<cmd>lua require('telescope.builtin').find_files({cwd = '/home/bsg/notes/wiki/src'})<CR>",
  opts
) -- TODO: configure a bit more
