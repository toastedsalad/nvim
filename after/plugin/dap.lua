local dap = require('dap')

if not dap.adapters["netcoredbg"] then
    require("dap").adapters["netcoredbg"] = {
        type = "executable",
        command = '/home/gedaas/.local/share/nvim/mason/bin/netcoredbg',
        args = { "--interpreter=vscode" },
        options = {
            detached = false,
        },
    }
end

-- Python adapter
if not dap.adapters["python"] then
    dap.adapters.python = {
        type = 'executable',
        command = vim.fn.exepath('python'), -- or full path to your Python interpreter
        args = { '-m', 'debugpy.adapter' },
    }
end

-- .NET debugger
for _, lang in ipairs({ "cs", "fsharp", "vb" }) do
    if not dap.configurations[lang] then
        dap.configurations[lang] = {
            {
                type = "netcoredbg",
                name = "Launch file",
                request = "launch",
                ---@diagnostic disable-next-line: redundant-parameter
                program = function()
                    return vim.fn.input("Path to dll: ", vim.fn.getcwd() .. "/", "file")
                end,
                cwd = "${workspaceFolder}",
            },
        }
    end
end

-- Python debugger, pip install debugpy
-- It's bugged .venv paths are ignored
-- dap.configurations.python = {
--     {
--         -- type = 'python',
--         -- request = 'launch',
--         -- name = 'Launch file',
--         -- program = "${file}", -- current file
--         pythonPath = function()
--             -- Use virtualenv if available, otherwise system Python
--             local venv_path = os.getenv('VIRTUAL_ENV')
--             if venv_path then
--                 return venv_path .. '/bin/python'
--             else
--                 return vim.fn.exepath('python')
--             end
--         end,
--     },
-- }



