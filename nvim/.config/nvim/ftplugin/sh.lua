-- set the Vim compiler program; use for auto-checking!
vim.api.nvim_command("compiler shellcheck")

vim.cmd([[
    augroup shellcheck
    au!
    au BufWritePost,FileType sh <cmd><silent> make %<CR>
    augroup END
]])
