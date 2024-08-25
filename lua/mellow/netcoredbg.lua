local dap = require('dap')

dap.adapters.coreclr = {
  type = 'executable',
  command = vim.fn.exepath("netcoredbg"),
  args = {'--interpreter=vscode'},
  options = {
      detached = false,
  },
}

dap.configurations.cs = {
  {
    type = "coreclr",
    name = "launch - netcoredbg",
    request = "launch",
    program = function()
        return vim.fn.input('Path to dll', vim.fn.getcwd() .. '', 'file')
    end,
  },
}

