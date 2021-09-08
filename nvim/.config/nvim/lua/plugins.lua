-- Autocmd to compile plugins upon changing plugins.lua
vim.cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerCompile
    augroup end
]])

-- This file is loaded by the require('plugins') line in init.lua

return require('packer').startup({
    function()
        -- Packer can manage itself
        use 'wbthomason/packer.nvim'

        -- Colorschemes
        use {
            'bluz71/vim-moonfly-colors',
            as = 'moonfly'
        }

        use {
            'gruvbox-community/gruvbox',
            as = 'gruvbox'
        }

        -- Plugin for visible indentlines
        use 'Yggdroot/indentLine'

        -- Note-taking, todo-lists and more!
        use {
            'vhyrro/neorg',
            branch = 'unstable'
        }

        -- Pretty CSS colors and icons
        use {
            'kyazdani42/nvim-web-devicons',
            as = 'devicons'
        }

        use {
            'norcalli/nvim-colorizer.lua',
            as = 'css-colors'
        }

        -- Change 'surroundings'
        use 'tpope/vim-surround'

        -- Nifty startup time profile breakdown
        use {
            'tweekmonster/startuptime.vim',
            as = 'startuptime',
            opt = true,
            cmd = 'StartupTime'
        }

        -- Commenting superpowers
        use 'winston0410/commented.nvim'


        -- Telescope and dependencies
        use {
            'nvim-telescope/telescope.nvim',
            requires = { 'nvim-lua/plenary.nvim' }
        }

        -- Treesitter and related goodies
        use {
            'nvim-treesitter/nvim-treesitter',
            run = ':TSUpdate'
        }

        use 'nvim-treesitter/playground'

        -- LSP stuff - config + install
        use {
            'neovim/nvim-lspconfig',
            as = 'lspconfig'
        }

        use {
            'kabouzeid/nvim-lspinstall',
            as = 'lspinstall'
        }

        -- (Auto)Completion
        use {
            'hrsh7th/nvim-cmp',
            requires = {
                -- snippet engine
                'hrsh7th/vim-vsnip',
                -- lsp-based completion source
                'hrsh7th/cmp-nvim-lsp'
            }
        }

        -- Code prettification
        use 'mhartington/formatter.nvim'

        -- Statusline
        use {
            'hoob3rt/lualine.nvim',
            requires = {'kyazdani42/nvim-web-devicons', opt=true}
        }
    end,
    config = {
        display = {
            open_fn = function()
                return require('packer.util').float({ border = 'single' })
            end
        }
    }
})

