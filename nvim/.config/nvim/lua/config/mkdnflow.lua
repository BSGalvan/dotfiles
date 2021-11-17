if not pcall(require, "mkdnflow") then
  return
end

require("mkdnflow").setup({
  evaluate_prefix = false,
  new_file_prefix = [[]],
  wrap_to_beginning = true,
  wrap_to_end = true,
})
