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
        use({
            'bluz71/vim-moonfly-colors',
            as = 'moonfly',
            config = function()
                require"config.theme"
            end
        })

        -- Plugin for visible indent levels,
        -- even on blank lines
        use {
            'lukas-reineke/indent-blankline.nvim',
            config = function()
                require"config.indent-blankline"
            end
        }

        -- Pretty CSS colors
        use {
            'norcalli/nvim-colorizer.lua',
            as = 'css-colors',
            opt = true,
            cmd = {
                "ColorizerToggle",
                "ColorizerAttachToBuffer",
                "ColorizerDetachFromBuffer",
                "ColorizerReloadAllBuffers",
            },
            config = function()
                require("config.colorizer")
            end,
        }

        -- Change 'surroundings'
        use 'tpope/vim-surround'

        -- Nifty plugin for startup time profile breakdown
        use {
            'tweekmonster/startuptime.vim',
            as = 'startuptime',
            cmd = "StartupTime",
        }

        -- Commenting superpowers
        use {
            'winston0410/commented.nvim',
            config = function()
                require("config.commented")
            end
        }

        -- Telescope and dependencies
        use {
            'nvim-telescope/telescope.nvim',
            requires = { 'nvim-lua/plenary.nvim' }
        }

        -- Treesitter and related goodies
        use {
            'nvim-treesitter/nvim-treesitter',
            run = ':TSUpdate',
            opt = true,
            event = "BufRead",
            requires = {
                {
                    "nvim-treesitter/playground",
                    opt = true,
                    cmd = "TSPlaygroundToggle"
                }
            },
            config = function()
                require("config.treesitter")
            end
        }

        -- LSP stuff - config + install
        use {
            'neovim/nvim-lspconfig',
            as = 'lspconfig',
            requires = {
                {
                    "kabouzeid/nvim-lspinstall",
                    as = 'lspinstall'
                }
            },
        }

        -- (Auto)Completion
        use {
            'hrsh7th/nvim-cmp',
            requires = {
                {
                    -- snippet engine
                    'hrsh7th/vim-vsnip',
                },
                {
                    -- lsp-based completion source
                    'hrsh7th/cmp-nvim-lsp',
                }
            },
            config = function()
                require("config.nvim-cmp")
            end
        }

        -- Note-taking and more!
        use { 
            "vhyrro/neorg",
            branch = "unstable",
            requires = "nvim-lua/plenary.nvim",
            after = "nvim-treesitter",
            config = function()
                require("config.neorg")
            end
        }

        -- Code prettification
        use {
            'mhartington/formatter.nvim',
            opt = true,
            cmd = "Format",
            config = function()
                require("config.formatter")
            end
        }

        -- Statusline
        use {
            'shadmansaleh/lualine.nvim',
            requires = { 'kyazdani42/nvim-web-devicons' },
            config = function()
                require("config.lualine")
            end
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
