vim.g.mapleader = " "

vim.keymap.set("n", "<leader>jm", vim.cmd.Ex)
vim.keymap.set("n", "<leader>ss", vim.cmd.vsplit)

local dap = require('dap')
vim.keymap.set('n', '<F6>', dap.continue, { silent = true })
vim.keymap.set('n', '<F7>', dap.step_over, { silent = true })
vim.keymap.set('n', '<F8>', dap.step_into, { silent = true })
vim.keymap.set('n', '<F9>', dap.step_out, { silent = true })
vim.keymap.set('n', '<F10>', dap.terminate, { silent = true })

vim.keymap.set('n', '<Leader>b', dap.toggle_breakpoint, { silent = true })
vim.keymap.set('n', '<Leader>B', function() dap.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, { silent = true })
vim.keymap.set('n', '<Leader>lp', function() dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end, { silent = true })
vim.keymap.set('n', '<Leader>dr', dap.repl.open, { silent = true })
vim.keymap.set('n', '<Leader>dl', dap.run_last, { silent = true })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "nzzzv")

vim.keymap.set("x", "p", "\"_dP")

vim.keymap.set('n', '<leader>y', "\"+y")
vim.keymap.set('v', '<leader>y', "\"+y")
vim.keymap.set('n', '<leader>Y', "\"+Y")

vim.keymap.set('n', 'd', "\"_d")
vim.keymap.set('v', 'd', "\"_d")

vim.keymap.set("n", "Q", "<nop>")
-- vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<Leader>fr", [[:%s/<C-r><C-w>//g<Left><Left>]])
-- Not sure what this is doing, I probably need to lear about the sessionizer.
-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- This is for the quickfix list navigation but I don't know what that even is...

-- vim.keymap.set('v', '<C-k>', "<cmd>cnext<CR>zz")
-- vim.keymap.set('v', '<C-j>', "<cmd>cprev<CR>zz")
-- vim.keymap.set('v', '<leader>k', "<cmd>lnext<CR>zz")
-- vim.keymap.set('v', '<leader>j', "<cmd>lprev<CR>zz")
