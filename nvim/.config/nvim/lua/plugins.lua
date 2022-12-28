-- Autocmd to compile plugins (with profiling) upon changing plugins.lua
-- Use <cmd>PackerProfile to see profiling results

vim.cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerCompile profile=true
    augroup end
]])

-- This file is loaded by the require('plugins') line in init.lua

return require("packer").startup({
  function()
    --[[
    --   TELESCOPE STUFF
    --   This section is for telescope.nvim itself,
    --   along with prerequisites, extensions etc.
    --]]
    use({
      "nvim-telescope/telescope.nvim",
      requires = {
        "nvim-lua/plenary.nvim",
        "nvim-lua/popup.nvim",
        {
          -- Telescope extension for better sorting
          "nvim-telescope/telescope-fzf-native.nvim",
          run = "make",
        },
        {
          -- Telescope extension for file operations
          "nvim-telescope/telescope-file-browser.nvim",
        },
      },
    })

    --[[
    --   TREESITTER STUFF
    --   This section is for nvim-treesitter itself,
    --   along with other goodies and extensions
    --]]
    use({
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
      requires = {
        "nvim-treesitter/playground",
        "p00f/nvim-ts-rainbow",
      },
    })

    --[[
    --   LSP & AUTO-COMPLETION STUFF
    --   This section is for nvim-lspconfig, nvim-cmp
    --   and the bevy of extensions for those two
    --]]

    -- LSP stuff - config + extra goodies
    use({
      "neovim/nvim-lspconfig",
      as = "lspconfig",
      requires = {
        -- lsp-powered signatures while you type!
        "ray-x/lsp_signature.nvim",
        -- Pictograms for neovim's LSP
        "onsails/lspkind-nvim",
        -- Provides the missing :LspInstall command
        -- "williamboman/nvim-lsp-installer",
        -- "Easily install and manage LSP servers, DAP servers, linters, and
        -- formatters." ~ from the mason.nvim README
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
      },
    })

    -- snippet engine
    use({
      "L3MON4D3/LuaSnip",
      requires = {
        -- lots of snippets for different filetypes
        "rafamadriz/friendly-snippets",
        -- "all-purpose" annotation generator
        "danymat/neogen",
      },
    })

    -- (Auto)Completion
    use({
      "hrsh7th/nvim-cmp",
      requires = {
        -- luasnip snippet source for nvim-cmp
        "saadparwaiz1/cmp_luasnip",
        -- neovim lua API completion source for nvim-cmp
        "hrsh7th/cmp-nvim-lua",
        -- neovim lsp completion source for nvim-cmp
        "hrsh7th/cmp-nvim-lsp",
        -- buffer completion source for nvim-cmp
        "hrsh7th/cmp-buffer",
        -- nvim-cmp completion source for the cmdline (:h cmdline)
        "hrsh7th/cmp-cmdline",
        -- nvim-cmp completion source for paths
        "hrsh7th/cmp-path",
        -- nvim-cmp completion source for LaTeX symbols
        "kdheepak/cmp-latex-symbols",
      },
    })

    --[[
    --  Debugging
    --  This section is for stuff which helps give Neovim
    --  debugging features
    --
    --]]
    -- Debug Adapter Protocol client in neovim, along with a few niceties.
    use({
      "mfussenegger/nvim-dap",
      requires = {
        {
          "theHamsta/nvim-dap-virtual-text",
          config = function()
            require("nvim-dap-virtual-text").setup()
          end,
        },
      },
    })

    use({
      "rcarriga/nvim-dap-ui",
      requires = { "mfussenegger/nvim-dap" },
      config = function()
        require("dapui").setup()
      end,
    })

    --[[
    --   PLUGINS FOR PRODUCTIVITY
    --   This section is for stuff which extends neovim
    --   to be more than just a text-editor
    --   (with some inspiration from the Church of Emacs, of course)
    --]]
    -- Distraction-free coding for Neovim
    use({
      "folke/zen-mode.nvim",
      config = function()
        require("zen-mode").setup()
      end,
    })

    -- Dim inactive parts of the code
    -- Lua
    use({
      "folke/twilight.nvim",
      config = function()
        require("twilight").setup()
      end,
    })

    -- Make editing commit messages more pleasant
    use({ "rhysd/committia.vim" })

    --[[
    --   tpope's PLUGINS
    --   Of course THE vim plugin artist gets his own section!
    --]]
    -- Change 'surroundings'
    use("https://tpope.io/vim/surround.git")

    -- Comment stuff out
    use({
      "https://tpope.io/vim/commentary.git",
    })

    -- "... a plugin so good, it should be illegal."
    use("https://tpope.io/vim/fugitive.git")

    --[[
    --   GOODIES 
    --   This section includes colorschemes, statuslines etc...
    --   essentially the eye-candy, prettification part of my neovim config
    --]]
    -- Colorschemes
    use({
      "bluz71/vim-moonfly-colors",
      as = "moonfly",
    })

    -- Statusline
    use({
      "nvim-lualine/lualine.nvim",
      requires = { "kyazdani42/nvim-web-devicons" },
    })

    -- Plugin for visible indent levels, even on blank lines
    use({
      "lukas-reineke/indent-blankline.nvim",
    })

    -- Pretty CSS colors
    use({
      "NvChad/nvim-colorizer.lua",
    })

    -- Code prettification
    use({
      "mhartington/formatter.nvim",
    })

    -- Horizontal highlights for markdown files
    use({
      "lukas-reineke/headlines.nvim",
      config = function()
        require("headlines").setup()
      end,
    })

    -- Fancy git decorations for the signcolumn
    use({
      "lewis6991/gitsigns.nvim",
    })

    -- smooth scrolling
    use({
      "karb94/neoscroll.nvim",
    })

    -- [[
    --   UTILITIES
    --   These are plugins which make configuration and
    --   upkeep of neovim's health easier
    -- ]]
    -- Packer can manage itself
    use("wbthomason/packer.nvim")

    -- Nifty plugin for startup time profile breakdown
    use({
      "tweekmonster/startuptime.vim",
      as = "startuptime",
      cmd = "StartupTime",
    })
  end,
  config = {
    display = {
      open_fn = function()
        return require("packer.util").float({ border = "double" })
      end,
    },
  },
})
