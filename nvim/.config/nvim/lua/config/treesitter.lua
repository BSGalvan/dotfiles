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
parser_configs.markdown = {
  install_info = {
    url = "https://github.com/ikatyang/tree-sitter-markdown",
    files = { "src/parser.c", "src/scanner.cc" },
  },
  filetype = "markdown",
}

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
  indent = {
    enable = true,
  },
})
