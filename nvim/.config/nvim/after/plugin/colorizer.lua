require 'colorizer'.setup({
    '*'; -- Highlight all files
    css = { css = true; }; -- Enable parsing rgb(...) functions in css.
}, {  mode = 'foreground' })
