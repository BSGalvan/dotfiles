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
      requires = "nvim-treesitter/playground",
      config = function()
        require("config.treesitter")
      end,
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
        {
          -- lsp-powered signatures while you type!
          "ray-x/lsp_signature.nvim",
          config = function()
            require("config.lsp_signature")
          end,
        },
        -- Pictograms for neovim's LSP
        "onsails/lspkind-nvim",
        -- Provides the missing :LspInstall command
        "williamboman/nvim-lsp-installer",
      },
    })

    -- snippet engine
    use({
      "L3MON4D3/LuaSnip",
      requires = {
        -- lots of snippets for different filetypes
        "rafamadriz/friendly-snippets",
      },
      config = function()
        require("config.snippets")
      end,
    })

    -- (Auto)Completion
    use({
      "hrsh7th/nvim-cmp",
      config = function()
        require("config.nvim-cmp")
      end,
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
    --   PLUGINS FOR PRODUCTIVITY
    --   This section is for stuff which extends neovim
    --   to be more than just a text-editor
    --   (with some inspiration from the Church of Emacs, of course)
    --]]
    -- Note-taking and more!
    use({
      "nvim-neorg/neorg",
      branch = "unstable",
      after = {
        "nvim-treesitter",
        "nvim-cmp",
      },
      requires = "nvim-lua/plenary.nvim",
      config = function()
        require("config.neorg")
      end,
    })

    -- A simpler version of vimwiki, now in Lua!
    use({
      "jakewvincent/mkdnflow.nvim",
      config = function()
        require("config.mkdnflow")
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
      opt = true,
      keys = { "gc", "gcc" },
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
      config = function()
        require("config.theme")
      end,
    })

    use({
      "NTBBloodbath/doom-one.nvim",
    })

    -- Statusline
    use({
      "nvim-lualine/lualine.nvim",
      requires = { "kyazdani42/nvim-web-devicons" },
      config = function()
        require("config.lualine")
      end,
    })

    -- Plugin for visible indent levels, even on blank lines
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

    -- Code prettification
    use({
      "mhartington/formatter.nvim",
      opt = true,
      event = "BufWritePost",
      config = function()
        require("config.formatter")
      end,
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
      config = function()
        require("config.gitsigns")
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
  end,
  config = {
    display = {
      open_fn = function()
        return require("packer.util").float({ border = "double" })
      end,
    },
  },
})
