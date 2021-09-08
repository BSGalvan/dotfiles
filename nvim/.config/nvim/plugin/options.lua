-- Almost exclusively ripped-off from tjdevries/config_manager
-- along with some bit of customization by yours truly

local opt = vim.opt

-- TODO: figure out if this order of wildmode customization
--       is a conscious choice or not.

-- Ignore compiled files
opt.wildignore = "__pycache__"
opt.wildignore = opt.wildignore + { "*.o", "*~", "*.pyc", "*pycache*" }

opt.wildmode = { "longest", "full" }

-- Cool floating window popup menu for completion on the command line
opt.pumblend = 15

opt.wildoptions = "pum"

opt.autoindent = true                          -- Turn (auto)indenting ON
opt.background = "dark"                        -- Needed for dark bg
opt.clipboard = "unnamedplus"                  -- Set clipboard to SYSTEM

-- See :h 'cot'
opt.completeopt = {
    'menuone',
    'preview',
    'noselect'
}

opt.autochdir = true                           -- Automove to buffer's directory
opt.formatoptions:remove({ 'c', 'r', 'o' })    -- Stop autocommenting!
opt.expandtab = true                           -- Expand <Tab> to spaces
opt.foldlevel = 99                             -- Fold till where?
opt.foldmethod = "indent"                      -- Fold at what?
opt.guicursor = ""                             -- Turn off mode-based cursor
opt.hidden = true                              -- Allow buffer navigation w/o saving
opt.incsearch = true                           -- Highlight matches incrementally

-- How do I reveal whitespace characters?
opt.listchars = {
    eol = "﬋",
    tab = ">·",
    trail = "~"
}

opt.matchtime=1                                -- Time (in x0.1s) to match parentheses
opt.hlsearch = false                           -- Search matches don't persist
opt.wrap = false                               -- Don't wrap lines
opt.number = true                              -- Turn on line numbers
opt.relativenumber = true                      -- Number lines relative to current line
opt.scrolloff=8                                -- Edge limits beyond which to start scroll
opt.shiftwidth=4                               -- Number of spaces for (auto)indenting
opt.showcmd = true                             -- Show (partial) commands in status line
opt.showmatch = true                           -- Need this to allow parentheses matching
opt.smartindent = true                         -- Well, indent smartly!
opt.softtabstop=4                              -- Edit operation <Tab><->space replacement
opt.splitbelow = true                          -- Open new splits below the current buffer
opt.splitright = true                          -- Open new vsplits right of current buffer
opt.tabstop=4                                  -- <Tab> = these many spaces
opt.termguicolors = true                       -- Enable 24-bit RGB colorspace
