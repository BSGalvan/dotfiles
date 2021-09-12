-- Stolent from michaelb/sniprun's wiki
-- Configuration for sniprun

require("sniprun").setup {
  -- Check :SnipInfo and :h sniprun for more info
  -- use these instead of the default for the current filetype
  selected_interpreters = { "python3_fifo" },

  -- enable REPL-like behavior for the given interpreters
  repl_enable = { "python3_fifo" },

  -- disable REPL-like behavior for the given interpreters
  repl_disable = {},

  -- intepreter-specific options, consult docs / :SnipInfo <name>
  interpreter_options = {},

  -- you can combo different display modes as desired
  display = {
    -- "Classic",                 -- display results in the command-line  area
    -- "VirtualTextOk",              -- display ok results as virtual text (multiline is shortened)
    "VirtualTextErr", -- display error results as virtual text
    "TempFloatingWindow", -- display results in a floating window
    -- "LongTempFloatingWindow",  -- same as above, but only long results. To use with VirtualText__
    -- "Terminal"                    -- display results in a vertical split
  },

  -- customize highlight groups (setting this overrides colorscheme)
  snipruncolors = {
    SniprunVirtualTextOk = { bg = "#36c692", fg = "#080808", ctermbg = 11, cterfg = 0 },
    SniprunVirtualTextErr = { bg = "#ff5454", fg = "#080808", ctermbg = 2, cterfg = 0 },
    SniprunFloatingWinOk = { fg = "#36c692", ctermfg = 11 },
    SniprunFloatingWinErr = { fg = "#ff5454", ctermfg = 2 },
  },

  -- miscellaneous compatibility/adjustment settings
  -- inline_message (0/1) is a one-line way to display messages
  -- to workaround sniprun not being able to display anything
  inline_messages = 0,

  -- display borders around floating windows
  -- possible values are 'none', 'single', 'double', or 'shadow'
  borders = "single",
}
