local map_key = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map_key("n", "<space>dc", "<cmd>lua require('dap').continue()<CR>", opts)
map_key("n", "<space>do", "<cmd>lua require('dap').step_over()<CR>", opts)
map_key("n", "<space>di", "<cmd>lua require('dap').step_into()<CR>", opts)
map_key("n", "<space>dO", "<cmd>lua require('dap').step_out()<CR>", opts)
map_key("n", "<space>db", "<cmd>lua require('dap').toggle_breakpoint()<CR>", opts)
map_key("n", "<space>dq", "<cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", opts)
map_key(
  "n",
  "<space>dl",
  "<cmd>lua require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>",
  opts
)
map_key("n", "<space>dro", "<cmd>lua require('dap').repl.open()<CR>", opts)
map_key("n", "<space>drl", "<cmd>lua require('dap').run_last()<CR>", opts)

local dap = require("dap")

dap.adapters.python = {
  type = "executable",
  command = "/home/bsg/.local/share/mambaforge/bin/python",
  args = { "-m", "debugpy.adapter" },
}

dap.configurations.python = {
  {
    -- The first three options are required by nvim-dap
    type = "python", -- the type here established the link to the adapter definition: `dap.adapters.python`
    request = "launch",
    name = "Launch file",

    -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

    program = "${file}", -- This configuration will launch the current file if used.
    pythonPath = function()
      -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
      -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
      -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.

      local conda_prefix = os.getenv("CONDA_PREFIX")
      if vim.fn.executable(conda_prefix .. "/bin/python") == 1 then
        return conda_prefix .. "/bin/python"
      else
        return "/usr/bin/python"
      end
    end,
  },
}
