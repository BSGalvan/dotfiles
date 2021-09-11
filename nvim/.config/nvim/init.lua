local fn = vim.fn
local cmd = vim.cmd
local g = vim.g

-- Bootstrapping packer install
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  cmd 'packadd packer.nvim'
end

-- Best to set it here, so that all references to <leader> later on map correctly
g.mapleader = ","

-- Disable all builtin plugins not in use.
require"bsg.disable_builtin"

-- Load the plugins file
-- no need to load this immediately, since we have packer_compiled
vim.defer_fn(
    function()
        require"plugins"
    end,
    0
)

-- Neovim builtin LSP configuration
require"bsg.lsp"

-- Telescope btw
require"bsg.telescope"
