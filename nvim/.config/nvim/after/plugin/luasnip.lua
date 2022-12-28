-- Stolen from folke/dot, and from tj's LuaSnip videos
-- You may also want to see the excellent guide over at:
-- https://www.ejmastnak.com/tutorials/vim-latex/luasnip/
-- Snippets configuration

local ls = require("luasnip")
local types = require("luasnip.util.types")

ls.config.set_config({
  -- Tell LuaSnip to keep around the last snippet.
  -- You can jump back into it even if you move outside of the selection
  history = true,

  -- Update more often, even as you type, :h events for more info.
  updateevents = "TextChanged, TextChangedI",

  enable_autosnippets = true,

  ext_opts = {
    [types.insertNode] = {
      active = {
        hl_group = "MoonflyLime",
      },
    },
    [types.choiceNode] = {
      active = {
        virt_text = { { "<- Choice", "Todo" } },
      },
    },
  },
})

-- <c-k> is now the snippet expansion key
-- this will expand the current item, or jump to next item within the current snippet.
vim.keymap.set({ "i", "s" }, "<c-k>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true })

-- <c-j> is now the jump backward key
-- this will always go back one item in the current snippet.
vim.keymap.set({ "i", "s" }, "<c-j>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true })

-- <c-l> is for selecting within a list of choiceNodes
vim.keymap.set("i", "<c-l>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end)

-- a keymap for blazing-fast config reloading!!!
vim.keymap.set("n", "<leader><leader>s", "<cmd>source ~/.config/nvim/after/plugin/luasnip.lua<CR>")

require("luasnip.loaders.from_vscode").lazy_load()
-- require("luasnip-snippets").load_snippets()
require("luasnip.loaders.from_lua").lazy_load({ paths = "~/.config/nvim/lua/snippets" })
