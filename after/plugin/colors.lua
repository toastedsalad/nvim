function ColorMyVim(color)
    color = color or "rose-pine"
    vim.cmd.colorscheme(color)

    -- Transparent background
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

    -- Override string color
    vim.api.nvim_set_hl(0, "String", { fg = "#e0b97f" }) -- pick your favorite color
end

ColorMyVim()
