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
    -- Packer can manage itself
    use("wbthomason/packer.nvim")

    -- Colorschemes
    use({
      "bluz71/vim-moonfly-colors",
      as = "moonfly",
      config = function()
        require("config.theme")
      end,
    })

    -- Plugin for visible indent levels,
    -- even on blank lines
    use({
      "lukas-reineke/indent-blankline.nvim",
      config = function()
        require("config.indent-blankline")
      end,
    })

    -- Pretty CSS colors
    use({
      "norcalli/nvim-colorizer.lua",
      as = "css-colors",
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
    })

    -- Change 'surroundings'
    use("tpope/vim-surround")

    -- Nifty plugin for startup time profile breakdown
    use({
      "tweekmonster/startuptime.vim",
      as = "startuptime",
      cmd = "StartupTime",
    })

    use({
      "b3nj5m1n/kommentary",
      opt = true,
      keys = { "gc", "gcc" },
    })

    -- Telescope and dependencies
    use({
      "nvim-telescope/telescope.nvim",
      requires = {
        "nvim-lua/plenary.nvim",
        "nvim-lua/popup.nvim",
      },
    })

    -- Telescope extension for better sorting
    use({
      "nvim-telescope/telescope-fzf-native.nvim",
      run = "make",
    })

    -- Treesitter and related goodies
    use({
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
      opt = true,
      event = "BufRead",
      requires = "nvim-treesitter/playground",
      config = function()
        require("config.treesitter")
      end,
    })

    -- LSP stuff - config + install
    use({
      "neovim/nvim-lspconfig",
      as = "lspconfig",
      requires = {
        {
          "kabouzeid/nvim-lspinstall",
          as = "lspinstall",
        },
      },
    })

    -- lsp-powered signatures while you type!
    use({
      "ray-x/lsp_signature.nvim",
      config = function()
        require("config.lsp_signature")
      end,
    })

    -- lots of snippets
    use({
      "rafamadriz/friendly-snippets",
      event = "InsertEnter",
    })

    -- snippet engine
    use({
      "L3MON4D3/LuaSnip",
      requires = "friendly-snippets",
      after = "friendly-snippets",
      config = function()
        require("config.snippets")
      end,
    })

    -- (Auto)Completion
    use({
      "hrsh7th/nvim-cmp",
      after = "LuaSnip",
      config = function()
        require("config.nvim-cmp")
      end,
    })

    -- luasnip snippet source for nvim-cmp
    use({
      "saadparwaiz1/cmp_luasnip",
      after = "LuaSnip",
    })

    -- neovim lua API completion source for cmp
    use({
      "hrsh7th/cmp-nvim-lua",
      after = "cmp_luasnip",
    })

    -- nvim-cmp completion source for lsp
    use({
      "hrsh7th/cmp-nvim-lsp",
      after = "cmp-nvim-lua",
    })

    -- nvim-cmp completion source for buffers
    use({
      "hrsh7th/cmp-buffer",
      after = "cmp-nvim-lsp",
    })

    -- Code prettification
    use({
      "mhartington/formatter.nvim",
      opt = true,
      event = "BufWritePost",
      config = function()
        require("config.formatter")
      end,
    })

    -- Note-taking and more!
    use({
      "lukas-reineke/headlines.nvim",
      config = function()
        require("headlines").setup()
      end,
    })

    -- Statusline
    use({
      "nvim-lualine/lualine.nvim",
      requires = { "kyazdani42/nvim-web-devicons" },
      config = function()
        require("config.lualine")
      end,
    })

    -- smooth scrolling
    use({
      "karb94/neoscroll.nvim",
      opt = true,
      keys = {
        "<c-d>",
        "<c-u>",
        "<c-b>",
        "<c-f>",
        "<c-e>",
        "<c-y>",
        "zt",
        "zz",
        "zb",
      },
      config = function()
        require("config.neoscroll")
      end,
    })

    -- Interactive neovim scratchpad for Lua!
    use({
      "rafcamlet/nvim-luapad",
      opt = true,
      cmd = {
        "Luapad",
        "LuaRun",
      },
      config = function()
        require("luapad").init()
      end,
    })

    use({
      "jakewvincent/mkdnflow.nvim",
      config = function()
        require("mkdnflow").setup({
          evaluate_prefix = false,
          new_file_prefix = [[]],
        })
      end,
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
