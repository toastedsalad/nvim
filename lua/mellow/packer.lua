-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Cosmetics
    use({
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            vim.cmd('colorscheme rose-pine')
        end
    })

    -- General nvim plugins for navigation and editting
    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use("nvim-lua/plenary.nvim")
    use {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        requires = { {"nvim-lua/plenary.nvim"} }
    }
    use("mbbill/undotree")
    use("tpope/vim-fugitive")
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use({
        'rmagatti/auto-session',
        config = function()
            require("auto-session").setup {
                suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
            }
        end
    })


    -- Lsp related plugins
    use({'neovim/nvim-lspconfig'})
    use({'hrsh7th/nvim-cmp'})
    use({'hrsh7th/cmp-nvim-lsp'})

    -- Mason, yet another package manager
    use({'williamboman/mason-lspconfig.nvim'})
    use({'williamboman/mason.nvim'})
    use({'WhoIsSethDaniel/mason-tool-installer.nvim'})

    -- CSHARP extensions
    use({'Hoffs/omnisharp-extended-lsp.nvim'})

    -- Debugging
    use({'mfussenegger/nvim-dap'})
    use({'rcarriga/nvim-dap-ui'})
    use({'nvim-neotest/nvim-nio'})

    -- Notest and .net framework adapters
    use({
        "nvim-neotest/neotest",
        requires = {
            {
                "nsidorenco/neotest-vstest",
                "antoinemadec/FixCursorHold.nvim"
            },
        }
    })

    -- Vim game
    use({'ThePrimeagen/vim-be-good'})

end)
