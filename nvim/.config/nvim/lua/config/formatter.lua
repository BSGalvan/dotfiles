local map_key = vim.api.nvim_set_keymap
local opts = { noremap = true }

require("formatter").setup({
  filetype = {
    c = {
      -- astyle format
      function()
        return {
          exe = "astyle",
          args = { "--style=linux -s8" },
          stdin = true,
        }
      end,
    },
    html = {
      function()
        return {
          exe = "npm prettier",
          args = { "--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), "--single-quote" },
          stdin = true,
        }
      end,
    },
    python = {
      function()
        return {
          exe = "black",
          -- require the - to indicate that inputs are from stdin
          args = { "-" },
          stdin = true,
        }
      end,
    },
    lua = {
      function()
        return {
          exe = "stylua",
          args = { "--indent-type=Spaces --indent-width=2 - " },
          stdin = true,
        }
      end,
    },
    rust = {
      function()
        return {
          exe = "rustfmt",
          args = { "--emit=stdout" },
          stdin = true,
        }
      end,
    },
  },
})

-- Formatter.nvim specific mappings
map_key("n", "<F5>", "<cmd>FormatWrite<CR>", opts)
