-- Stolen from folke/dot
-- LuaSnip configuration

local present, luasnip = pcall(require, "luasnip")
if not present then
  return
end

luasnip.config.set_config({
  history = true,
  -- Update more often, :h events for more info.
  updateevents = "TextChanged,TextChangedI",
})

require("luasnip/loaders/from_vscode").load()
