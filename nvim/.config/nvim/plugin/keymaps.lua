local map_key = vim.api.nvim_set_keymap
local opts = { noremap = true }

-- Move to split below / above / left / right
map_key("n", "<c-j>", "<c-w><c-j>", opts)
map_key("n", "<c-k>", "<c-w><c-k>", opts)
map_key("n", "<c-l>", "<c-w><c-l>", opts)
map_key("n", "<c-h>", "<c-w><c-h>", opts)

-- Enable folding with space
map_key("n", "<space>", "za", opts)

-- Add move line shortcuts
-- See vim.fandom.com/wiki/Moving_lines_up_or_down#Mappings_to_move_lines
map_key("n", "<A-S-j>", ":m .+1<CR>==", opts)
map_key("n", "<A-S-k>", ":m .-2<CR>==", opts)
map_key("i", "<A-S-j>", "<Esc>:m .+1<CR>==gi", opts)
map_key("i", "<A-S-k>", "<Esc>:m .-2<CR>==gi", opts)
map_key("v", "<A-S-j>", ":m '>+1<CR>gv=gv", opts)
map_key("v", "<A-S-k>", ":m '<-2<CR>gv=gv", opts)

-- Show non-printing characters
-- (EOL, trailing spaces, newlines, tabs etc.)
map_key("n", "<F12>", "<cmd>set list!<CR>", opts)

-- Alias :%s/<>/<>/gc with S
map_key("n", "S", ":%s///gc<Left><Left><Left><Left>", opts)

-- Tab navigation
map_key("n", "<leader>l", "<cmd>tabnext<CR>", opts)
map_key("n", "<leader>h", "<cmd>tabprev<CR>", opts)
map_key("n", "<leader>j", "<cmd>tablast<CR>", opts)
map_key("n", "<leader>k", "<cmd>tabfirst<CR>", opts)

-- Tab management
map_key("n", "tn", "<cmd>tabnew<CR>", opts)
map_key("n", "tc", "<cmd>tabclose<CR>", opts)
map_key("n", "tm", ":tabm<Space>", { noremap = true })
map_key("n", "te", ":tabedit<Space>", { noremap = true })

-- Open vertical/horizontal splits
map_key("n", "<Leader>s", ":split<Space>", { noremap = true })
map_key("n", "<Leader>v", ":vsplit<Space>", { noremap = true })

-- Telescope.nvim specific mappings
map_key("n", "<Space>fb", "<cmd>Telescope buffers<CR>", opts)
map_key(
  "n",
  "<Space>fd",
  "<cmd>lua require('telescope.builtin').file_browser({cwd = '/home/bsg/dotfiles', hidden = true})<CR>",
  opts
)
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
