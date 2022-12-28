-- options for rust files
vim.opt_local.makeprg = "cargo build --bin " .. vim.fn.expand("%:t:r")
