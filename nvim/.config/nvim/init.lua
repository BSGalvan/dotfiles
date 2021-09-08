local fn = vim.fn
local cmd = vim.cmd

-- Bootstrapping packer install
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({
        'git',
        'clone',
        '--depth',
        '1',
        'https://github.com/wbthomason/packer.nvim',
        install_path
    })
    cmd 'packadd packer.nvim'
end

cmd([[
    augroup easymode
        au!
        au FileType * setlocal formatoptions-=cro    "Turn autocommenting off
        au BufEnter * silent! lcd %:p:h              "Jump to dir of local buffer
        au BufWritePost init.lua,*.vimrc source %    "Source init.lua upon saving it
    augroup END
]])

-- Best to set it here, so that all references to <leader> later on map correctly
vim.g.mapleader = ","

-- Neovim builtin LSP configuration
require "bsg.lsp"
