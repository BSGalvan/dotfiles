local map_key = vim.api.nvim_set_keymap
local opts = { noremap = true }

-- Move to split below / above / left / right
map_key("n", "<c-j>", "<c-w><c-j>", opts)
map_key("n", "<c-k>", "<c-w><c-k>", opts)
map_key("n", "<c-l>", "<c-w><c-l>", opts)
map_key("n", "<c-h>", "<c-w><c-h>", opts)

-- Enable folding with space
map_key("n", "<space>", "za", opts)

-- Move current line up / down
map_key("n", "_", "ddkP", opts)
map_key("n", "-", "ddp", opts)

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

-- Formatter.nvim specific mappings
map_key("n", "<F5>", "<cmd>Format<CR>", { noremap = true })

-- Telescope.nvim specific mappings
map_key("n", "<Space>fb", "<cmd>Telescope buffers<CR>", opts)
map_key("n", "<Space>fe", "<cmd>Telescope file_browser<CR>", opts)
map_key("n", "<Space>ff", "<cmd>Telescope find_files<CR>", opts)
map_key("n", "<Space>fh", "<cmd>Telescope help_tags<CR>", opts)
map_key("n", "<Space>fo", "<cmd>Telescope oldfiles<CR>", opts)
map_key("n", "<Space>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", opts)
map_key("n", "<Space>t", "<cmd>Telescope<CR>", opts)

-- Sniprun specific mappings
map_key("v", "f", "<Plug>SnipRun", { silent = true })
map_key("n", "<leader>f", "<Plug>SnipRunOperator", { silent = true })
map_key("n", "<leader>ff", "<Plug>SnipRun", { silent = true })
map_key("n", "<leader>fc", "<Plug>SnipClose", { silent = true })
