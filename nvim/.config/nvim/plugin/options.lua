-- Almost exclusively ripped-off from tjdevries/config_manager
-- along with some bit of customization by yours truly

local opt = vim.opt

vim.g.python3_host_prog = "/usr/bin/python3"

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
opt.foldlevel = 99 -- Fold till where?
opt.foldmethod = "indent" -- Fold at what?
opt.guicursor = "" -- Turn off mode-based cursor
opt.hidden = true -- Allow buffer navigation w/o saving
opt.hlsearch = false -- Search matches don't persist
opt.incsearch = true -- Highlight matches incrementally
opt.matchtime = 1 -- Time (in 100ms) to match parentheses
opt.number = true -- Turn on line numbers
opt.relativenumber = true -- Number lines relative to current line
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

opt.formatoptions = opt.formatoptions
  - "a" -- Auto formatting is BAD.
  - "t" -- Don't auto format my code. I got linters for that.
  + "c" -- In general, I like it when comments respect textwidth
  + "q" -- Allow formatting comments w/ gq
  - "o" -- O and o, don't continue comments
  - "r" -- And don't continue when pressing enter.
  + "n" -- Indent past the formatlistpat, not underneath it.
  + "j" -- Auto-remove comments if possible.
  - "2" -- I'm not in gradeschool anymore

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
