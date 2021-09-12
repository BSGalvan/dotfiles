require("telescope").setup {
  defaults = {
    -- Configure settings common to all pickers, sorters and previewers
    winblend = 5,
    prompt_prefix = "τ: ",
    selection_caret = ">> ",
  },
  pickers = {
    -- Configure settings for specific pickers
    file_browser = {
      theme = "ivy",
      hidden = "true",
    },
  },
}
