-- mellow/tmux.lua
local M = {}

function M.split_here(horizontal)
    local dir
    if vim.bo.filetype == "netrw" then
        -- Use netrw's current directory if available
        dir = vim.b.netrw_curdir or vim.fn.getcwd()
    else
        dir = vim.fn.expand("%:p:h")
    end

    local split_flag = horizontal and "-h" or "-v"
    local size_col = horizontal and "50" or "12" -- width for horizontal, height for vertical

    vim.fn.system({
        "tmux", "split-window",
        split_flag,
        "-c", dir,
        "-l", size_col
    })
end

vim.keymap.set("n", "<leader>tv", function()
    M.split_here(true) -- horizontal
end, { desc = "Tmux split horizontally here" })

vim.keymap.set("n", "<leader>th", function()
    M.split_here(false) -- vertical
end, { desc = "Tmux split vertically here" })

return M

