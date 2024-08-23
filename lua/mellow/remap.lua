vim.g.mapleader = " "	
vim.keymap.set("n", "<leader>jm", vim.cmd.Ex)
vim.keymap.set("n", "<leader>ss", vim.cmd.vsplit)

local dap = require('dap')
vim.keymap.set('n', '<F5>', dap.continue, { silent = true })
vim.keymap.set('n', '<F6>', dap.step_over, { silent = true })
vim.keymap.set('n', '<F7>', dap.step_into, { silent = true })
vim.keymap.set('n', '<F9>', dap.step_out, { silent = true })
vim.keymap.set('n', '<Leader>T', dap.terminate, { silent = true })

vim.keymap.set('n', '<Leader>b', dap.toggle_breakpoint, { silent = true })
vim.keymap.set('n', '<Leader>B', function() dap.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, { silent = true })
vim.keymap.set('n', '<Leader>lp', function() dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end, { silent = true })
vim.keymap.set('n', '<Leader>dr', dap.repl.open, { silent = true })
vim.keymap.set('n', '<Leader>dl', dap.run_last, { silent = true })
