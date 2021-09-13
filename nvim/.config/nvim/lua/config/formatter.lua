local shfmt = function()
  return {
    exe = "shfmt",
    args = { "-s -i 4" },
    stdin = true,
  }
end

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
    bash = { shfmt },
    sh = { shfmt },
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
