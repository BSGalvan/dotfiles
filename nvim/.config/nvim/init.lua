local fn = vim.fn
local cmd = vim.cmd

-- Bootstrapping packer install
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd 'packadd packer.nvim'
end

-- Best to set it here, so that all references to <leader> later on map correctly
vim.g.mapleader = ","

-- Set the colour scheme
cmd [[ color moonfly ]]

cmd([[
    augroup initlua
        au!
        au BufWritePost init.lua source <afile>
    augroup end
]])

-- Neovim builtin LSP configuration
require"bsg.lsp"

-- Load the plugins file
require"plugins"
