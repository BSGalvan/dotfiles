let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(stdpath('data') . '/plugs')
    Plug 'bluz71/vim-moonfly-colors'
    Plug 'gruvbox-community/gruvbox'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/vim-vsnip'
    Plug 'kabouzeid/nvim-lspinstall'
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'mhartington/formatter.nvim'
    Plug 'neovim/nvim-lspconfig'
    Plug 'norcalli/nvim-colorizer.lua'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-treesitter/nvim-treesitter', {'do' : ':TSUpdate'}
    Plug 'nvim-treesitter/playground'
    Plug 'rstacruz/vim-closer'
    Plug 'tpope/vim-sensible'
    Plug 'tpope/vim-surround'
    Plug 'tweekmonster/startuptime.vim'
    Plug 'vhyrro/neorg', { 'branch':'unstable' }
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'winston0410/commented.nvim'
    Plug 'Yggdroot/indentLine'
call plug#end()

augroup easymode
        au!
        au FileType * setlocal formatoptions-=cro          "Turn autocommenting off
        au BufEnter * silent! lcd %:p:h                    "Jump to dir of local buffer
        au BufWritePost init.vim,*.vimrc source %          "Source vimrc upon saving it
augroup END

colorscheme moonfly
let mapleader = ','

source $XDG_CONFIG_HOME/nvim/config/sets.vimrc
source $XDG_CONFIG_HOME/nvim/config/maps.vimrc
source $XDG_CONFIG_HOME/nvim/config/plug_maps.vimrc
source $XDG_CONFIG_HOME/nvim/config/plug_sets.vimrc
source $XDG_CONFIG_HOME/nvim/config/status.vimrc

lua << EOF
    require("colorizer").setup{}
    require("zen-mode").setup{}
    require("telescope").setup{
        defaults = {
            winblend = 10,
        }
    }

    -- config for a norg parser for treesitter
    -- define before 'require'-ing treesitter itself
    local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()

    parser_configs.norg = {
        install_info = {
            url = "https://github.com/vhyrro/tree-sitter-norg",
            files = { "src/parser.c", "src/scanner.cc" },
            branch = "main"
        },
    }

    require'nvim-treesitter.configs'.setup{
        highlight = {
            enable = true
        }
    }

    local shfmt = function()
        return {
            exe = "shfmt",
            args = {"-s -i 4"},
            stdin = true
            }
    end

    require('formatter').setup({
        filetype = {
            c = {
                -- astyle format
                function()
                    return {
                        exe = "astyle",
                        args = {"--style=linux -s8"},
                        stdin = true
                        }
                end
            },
            bash = { shfmt },
            sh = { shfmt },
        }
    })

    require("bsg.lsp")

    -- nvim-cmp setup
    local cmp = require 'cmp'
    cmp.setup {
      snippet = {
        expand = function(args)
          vim.fn["vsnip#anonymous"](args.body)
        end,
      },
      mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        },
        ['<Tab>'] = function(fallback)
          if vim.fn.pumvisible() == 1 then
            vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-n>', true, true, true), 'n')
          else
            fallback()
          end
        end,
        ['<S-Tab>'] = function(fallback)
          if vim.fn.pumvisible() == 1 then
            vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-p>', true, true, true), 'n')
          else
            fallback()
          end
        end,
      },
      sources = {
        { name = 'nvim_lsp' },
        { name = 'neorg' },
      },
    }

    require('neorg').setup {
        -- Tell Neorg what modules to load
        load = {
            ["core.defaults"] = {}, -- Load all the default modules
            ["core.norg.concealer"] = {}, -- Allows for use of icons
            ["core.norg.completion"] = {
                config = {
                    engine = "nvim-cmp"
                }
            },
            ["core.keybinds"] = { -- Configure core.keybinds
                config = {
                    default_keybinds = true, -- Generate the default keybinds
                    neorg_leader = "<Leader>o" -- This is the default if unspecified
                }
            },
            ["core.norg.dirman"] = { -- Manage your directories with Neorg
                config = {
                    workspaces = {
                        my_workspace = "~/neorg"
                    }
                }
            }
        },
    }

    require('commented').setup{
        opts = {
            prefer_block_comment = false
        }
    }
EOF
