-- setup config for vimwiki

vim.cmd([[
    let g:vimwiki_list = [{
        \ "automatic_nested_syntaxes" : 1,
        \ "ext" : ".md",
        \ "path" : "$HOME/wiki/src",
        \ "syntax" : "markdown",
        \}]
]])
