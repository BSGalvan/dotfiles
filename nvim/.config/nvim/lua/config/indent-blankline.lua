if not pcall(require, "indent-blankline") then
    return
end

require("indent_blankline").setup {
    buftype_exclude = { "terminal" },
    char_list = {'|', '¦', '┆', '┊'},
    show_current_context = true,
    use_treesitte = true
}
