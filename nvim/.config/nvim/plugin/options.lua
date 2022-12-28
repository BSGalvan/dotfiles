-- Almost exclusively ripped-off from tjdevries/config_manager
-- along with some bit of customization by yours truly

local opt = vim.opt

if vim.fn.has("nvim") and not vim.fn.empty(vim.env.CONDA_PREFIX) then
  vim.g.python3_host_prog = vim.env.CONDA_PREFIX .. "/bin/python3"
end

-- TODO: figure out if this order of wildmode customization
--       is a conscious choice or not.

-- Ignore compiled files
opt.wildignore = "__pycache__"
opt.wildignore = opt.wildignore + { "*.o", "*~", "*.pyc", "*pycache*" }

opt.wildmode = { "longest", "full" }

-- Cool floating window popup menu for completion on the command line
opt.pumblend = 15
opt.wildoptions = "pum"

opt.autochdir = true -- Automove to buffer's directory
opt.autoindent = true -- Turn (auto)indenting ON
opt.background = "dark" -- Needed for dark bg
opt.clipboard = "unnamedplus" -- Set clipboard to SYSTEM
opt.expandtab = true -- Expand <Tab> to spaces
opt.fillchars = { -- improve look of line separators
  horiz = "━",
  horizup = "┻",
  horizdown = "┳",
  vert = "┃",
  vertleft = "┫",
  vertright = "┣",
  verthoriz = "╋",
}
opt.foldlevel = 99 -- Fold till where?
opt.foldmethod = "expr" -- Fold at what?
opt.foldexpr = "nvim_treesitter#foldexpr()" -- enable treesitter-based folding
opt.guicursor = "" -- Turn off mode-based cursor
opt.hidden = true -- Allow buffer navigation w/o saving
opt.hlsearch = false -- Search matches don't persist
opt.incsearch = true -- Highlight matches incrementally
opt.matchtime = 1 -- Time (in 100ms) to match parentheses
opt.number = true -- Turn on line numbers
opt.relativenumber = true -- Number lines relative to current line
opt.signcolumn = "yes" -- let this be on, so that gitsigns toggle doesn't seem abrupt
opt.scrolloff = 10 -- Edge limits beyond which to start scroll
opt.shiftwidth = 4 -- Number of spaces for (auto)indenting
opt.showcmd = true -- Show (partial) commands in status line
opt.showmatch = true -- Need this to allow parentheses matching
opt.smartindent = true -- Well, indent smartly!
opt.softtabstop = 4 -- Edit operation <Tab><->space replacement
opt.splitbelow = true -- Open new splits below the current buffer
opt.splitright = true -- Open new vsplits right of current buffer
opt.tabstop = 4 -- <Tab> = these many spaces
opt.termguicolors = true -- Enable 24-bit RGB colorspace
opt.timeoutlen = 500 -- Time (in ms) to wait for next keypress
opt.wrap = false -- Don't wrap lines

-- :h 'formatoptions' and :h fo-table for more info
vim.cmd([[
    augroup set_formatoptions
      autocmd!
      autocmd BufEnter * lua vim.bo.formatoptions="cqrnj"
    augroup END
]])

-- How do I reveal whitespace characters?
opt.listchars = {
  eol = "↲",
  tab = ">·",
  trail = "~",
}

-- See :h 'cot'
opt.completeopt = {
  "menuone",
  "preview",
  "noselect",
}
