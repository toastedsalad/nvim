local utils = require("neotest.utils") -- if available

require("neotest").setup({
    adapters = {
        require("neotest-vstest"),
        require("neotest-jest")({
            -- jestCommand = "npm test --",
            -- cwd = "/home/gedaas/source/seval-combo/SEVAL/webui/pkgs/sydneyeval-client",
            cwd = "/home/gedaas/source/klokit/frontend",
            jestTestDiscovery = false,
        }),
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

