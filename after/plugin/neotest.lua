require("neotest").setup({
    adapters = {
        require("neotest-vstest"),
        require("neotest-python")({
            dap = { justMyCode = false }, -- optional: enables debugging with DAP
            runner = "pytest",            -- or "unittest" if you prefer
        })

    }
})

vim.keymap.set('n', '<leader>td', function()
    require('neotest').run.run({ strategy = "dap" })
end, { noremap = true, silent = true })

vim.keymap.set('n', '<leader>tn', function()
    require('neotest').run.run()
end, { noremap = true, silent = true })

vim.keymap.set('n', '<leader>tf', function()
    require('neotest').run.run(vim.fn.expand('%'))
end, { noremap = true, silent = true })

