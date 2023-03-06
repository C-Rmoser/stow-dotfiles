-- vim.keymap.set('n', '<leader>dc', function() require('dap').continue() end)
vim.keymap.set('n', '<leader>db', function() require('dap').toggle_breakpoint() end)
vim.keymap.set('n', '<F1>', function() require('dap').continue() end)
vim.keymap.set('n', '<leader>dc', function() require('dap').continue() end)
vim.keymap.set('n', '<leader>dt', function() require('dap').terminate() end)
vim.keymap.set('n', '<F2>', function() require('dap').step_over() end)
vim.keymap.set('n', '<F3>', function() require('dap').step_into() end)
vim.keymap.set('n', '<F4>', function() require('dap').step_out() end)
vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)
-- vim.keymap.set('n', '<Leader>ds', function()
--   local widgets = require('dap.ui.widgets')
--   widgets.centered_float(widgets.scopes)
-- end)

vim.fn.sign_define('DapBreakpoint',{ text ='', texthl ='ErrorMsg', linehl ='', numhl =''})
vim.fn.sign_define('DapStopped',{ text ='', texthl ='Label', linehl ='', numhl =''})

local dap = require("dap")

dap.adapters.codelldb = {
  type = 'server',
  port = "${port}",
  executable = {
    -- CHANGE THIS to your path!
    command = '/home/crohrmoser/.local/share/nvim/mason/bin/codelldb',
    args = {"--port", "${port}"},

    -- On windows you may have to uncomment this:
    -- detached = false,
  }
}

dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
  },
}

dap.configurations.rust = dap.configurations.cpp
