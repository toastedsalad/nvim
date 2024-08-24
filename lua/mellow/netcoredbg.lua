local dap = require('dap')

dap.adapters.coreclr = {
  type = 'executable',
  command = '/home/mellow/.config/nvim/netcoredbg/netcoredbg',
  args = {'--interpreter=vscode'}
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

