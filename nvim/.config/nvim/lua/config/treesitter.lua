local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.org = {
  install_info = {
    url = "https://github.com/milisims/tree-sitter-org",
    revision = "main",
    files = { "src/parser.c", "src/scanner.cc" },
  },
  filetype = "org",
}

require("nvim-treesitter.configs").setup({
  highlight = {
    enable = true,
    -- Required since TSHighlight doesn't support all syntax features (conceal)
    -- should get removed once TS parser for org files gets better
    additional_vim_regex_highlighting = { 'org' } 
  },
  indent = {
    enable = true,
  },
})
