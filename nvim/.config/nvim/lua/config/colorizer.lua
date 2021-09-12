if not pcall(require, "colorizer") then
  return
end

require("colorizer").setup({
  -- Highlight all files
  "*",
  -- Enable parsing rgb(...) functions in css.
  css = { css = true },
}, {
  mode = "background",
})
