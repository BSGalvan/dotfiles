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
map_key("n", "tm", ":tabm<Space>", opts)
map_key("n", "te", ":tabedit<Space>", opts)

-- Open vertical/horizontal splits
map_key("n", "<Leader>s", ":split<Space>", opts)
map_key("n", "<Leader>v", ":vsplit<Space>", opts)

