vim.g.netrw_keepdir = 0

-- Find the git root for a given directory
local function find_git_root(start_dir)
    local result = vim.fn.systemlist({ "git", "-C", start_dir, "rev-parse", "--show-toplevel" })
    if vim.v.shell_error == 0 and result[1] and result[1] ~= "" then
        return result[1]
    end
    return nil
end

-- This runs AFTER netrw finishes setting its own working directory
vim.api.nvim_create_autocmd("FileType", {
    pattern = "netrw",
    callback = function()
        -- Delay until after netrw's own :lcd runs
        vim.schedule(function()
            if vim.b.netrw_curdir then
                local netrw_dir = vim.b.netrw_curdir
                local git_root = find_git_root(netrw_dir)

                if git_root then
                    -- If in git repo, use repo root
                    vim.cmd("lcd " .. vim.fn.fnameescape(git_root))
                else
                    -- Otherwise follow netrw's folder
                    vim.cmd("lcd " .. vim.fn.fnameescape(netrw_dir))
                end
            end
        end)
    end,
})
