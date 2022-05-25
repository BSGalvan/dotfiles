-- Need below for parsing specific files, until parser recieves first-class
-- support in the main treesitter repository
local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()

-- Treesitter grammar for .norg files
parser_configs.norg = {
  install_info = {
    url = "https://github.com/nvim-neorg/tree-sitter-norg",
    branch = "main",
    files = { "src/parser.c", "src/scanner.cc" },
  },
}

-- Treesitter grammar for .md files
-- parser_configs.markdown = {
--   install_info = {
--     url = "https://github.com/ikatyang/tree-sitter-markdown",
--     files = { "src/parser.c", "src/scanner.cc" },
--   },
--   filetype = "markdown",
-- }

require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "bash",
    "c",
    "html",
    "julia",
    "latex",
    "lua",
    "python",
    "rust",
    "toml",
    "vim",
  },
  highlight = {
    enable = true,
    -- Required since TSHighlight doesn't support all syntax features (conceal)
    -- should get removed once TS parser for (n)org files gets better
    additional_vim_regex_highlighting = { "norg" },
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = 10000,
    colors = {
      -- bluz71/nightfly bright colours
      "#ff5874",
      "#21c7a8",
      "#ecc48d",
      "#82aaff",
      "#ae81ff",
      "#7fdbca",
      "#d6deeb",
    },
  },
  indent = {
    enable = true,
  },
})
