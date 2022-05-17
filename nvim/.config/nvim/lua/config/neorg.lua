if not pcall(require, "neorg") then
  return
end

require("neorg").setup({
  load = {
    -- You'd put custom configuration options inside the squirly braces below ...
    ["core.defaults"] = {},
    ["core.norg.qol.toc"] = {},
    ["core.keybinds"] = {
      config = {
        default_keybinds = true, -- do autogenerate default keybinds
        neorg_leader = "<LocalLeader>",
      },
    },
    ["core.integrations.treesitter"] = {
      config = {
        highlights = {
          unorderedList = {
            ["1"] = "+TSAttribute",
            ["2"] = "+TSLabel",
            ["3"] = "+TSMath",
            ["4"] = "+TSString",
          },
        },
      },
    },
    ["core.gtd.base"] = {
      config = {
        workspace = "gtd",
      },
    },
    ["core.norg.concealer"] = {},
    ["core.norg.dirman"] = {
      config = {
        workspaces = {
          todo = "~/notes/neorg/todo",
          neovim = "~/notes/neorg/nvim",
          gtd = "~/notes/neorg/gtd",
          dsa = "~/notes/neorg/dsa",
        },
        -- Automatically detect whenever we have entered a subdirectory of a workspace
        autodetect = true,
        -- Automatically change the directory to the root of the workspace every time
        autochdir = true,
      },
    },
    ["core.norg.completion"] = {
      config = {
        engine = "nvim-cmp",
      },
    },
  },
  hook = function()
    local neorg_leader = "<Leader>o" -- for 'organize'

    -- Needed to tap into Neorg's core
    local neorg_callbacks = require("neorg.callbacks")

    -- Listen for the enable_keybinds event, which signals a "ready" state meaning we can bind keys.
    -- This hook will be called several times, e.g. whenever the Neorg Mode changes or an event that
    -- needs to reevaluate all the bound keys is invoked
    neorg_callbacks.on_event("core.keybinds.events.enable_keybinds", function(_, keybinds)
      -- Map all the below keybinds only when the "norg" mode is active
      keybinds.map_event_to_mode("norg", {
        n = { -- Bind keys in normal mode
          -- Keys for managing TODO items and setting their states
          { "gtd", "core.norg.qol.todo_items.todo.task_done" },
          { "gtu", "core.norg.qol.todo_items.todo.task_undone" },
          { "gtp", "core.norg.qol.todo_items.todo.task_pending" },
          { "<C-Space>", "core.norg.qol.todo_items.todo.task_cycle" },
        },
      }, {
        silent = true,
        noremap = true,
      })
    end)
  end,
})
