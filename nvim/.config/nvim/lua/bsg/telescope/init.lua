require("telescope").setup({
  defaults = {
    -- Configure settings common to all pickers, sorters and previewers
    winblend = 5,
    prompt_prefix = "τ: ",
    selection_caret = ">> ",
  },
  extensions = {
    file_browser = {
      theme = "ivy",
      hidden = true,
    },
  },
})

require("telescope").load_extension("fzf")
require("telescope").load_extension("file_browser")
