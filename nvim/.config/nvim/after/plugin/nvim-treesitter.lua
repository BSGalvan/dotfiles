require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "bash",
    "c",
    "html",
    "latex",
    "lua",
    "python",
    "rust",
    "toml",
    "vim",
  },
  highlight = {
    enable = true,
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
  incremental_selection = {
    enable = true,
    keymaps = {
      -- set to `false` to disable one of the mappings
      init_selection = "gni",     -- get node init
      node_incremental = "gk",   -- get node up (vim's up)
      node_decremental = "gj",   -- get node down (vim's down)
      scope_incremental = "gsk",  -- get scope, increase
    },
  },
})
