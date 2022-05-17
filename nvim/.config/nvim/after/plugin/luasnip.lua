-- Stolen from folke/dot, and from tj's LuaSnip videos
-- Snippets configuration

local function prequire(...)
  local status, lib = pcall(require, ...)
  if status then
    return lib
  end
  return nil
end

local ls = prequire("luasnip")

ls.config.set_config({
  -- Tell LuaSnip to keep around the last snippet.
  -- You can jump back into it even if you move outside of the selection
  history = true,
  -- Update more often, :h events for more info.
  updateevents = "TextChanged, TextChangedI",
  enable_autosnippets = true,
})

require("luasnip.loaders.from_vscode").lazy_load()
