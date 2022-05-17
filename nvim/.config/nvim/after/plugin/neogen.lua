local present, ng = pcall(require, "neogen")
if not present then
  return
end

ng.setup({
  enabled = true,
  snippet_engine = "luasnip",
  languages = {
    python = {
      template = {
        annotation_convention = "numpydoc",
      },
    },
  },
})
