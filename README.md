# My NeoVim Config

All of this is largerly based on theprimagen's config.
I just blatantly copied everytying over. Sort of...

## Some Key Notes

Aside from all the configs in this directory, here are some highlights.

This is using packer as the package manager
https://github.com/wbthomason/packer.nvim

Telescope as the fuzzy finder:
https://github.com/nvim-telescope/telescope.nvim

We will also use treesitter based highlighting as that is supposedly better.
https://github.com/nvim-treesitter/nvim-treesitter

We'll install the tree sitter playground. Probably not necessary but might be useful.
https://github.com/nvim-treesitter/playground

We will also install harpoon to quickly jumpt between different open files.
https://github.com/ThePrimeagen/harpoon/tree/harpoon2

Another cool plugin is the undo tree. It presents a history for undoing things.

## LSP
LSP requres multiple steps.
1. Install the language server itself. In our case this is going to be Omnisharp.

https://github.com/OmniSharp/omnisharp-roslyn/releases

Just untar it near neovim.

2. Install and configure the LSP for Vim. The getting started guide is pretty good and will get you going.
https://github.com/VonHeikemen/lsp-zero.nvim?tab=readme-ov-file

When the time comes to configure the Lsp, you will need to provide the following as the server:

```
require('lspconfig').omnisharp.setup{
cmd = { "dotnet", "/home/mellow/.config/nvim/omnisharp/OmniSharp.dll" },
}
```

3. Additional extensions for the omnisharp functionality are here. I've noticed that I couldn't check all references. Maybe this fixes it somehow.

https://github.com/Hoffs/omnisharp-extended-lsp.nvim
This thing is written by an absolute chad Lithuanian dude. Respekt. Teting it out now.


## Split Screen
Split screen is supported by default with :vsplit.
But the inactive screen looses transparency...

## List of Custom Keybindings

```
:!grep keymap -R ~/.config/nvim/                                                                                      
/home/mellow/.config/nvim/lua/mellow/remap.lua:vim.keymap.set("n", "<leader>ui", vim.cmd.Ex)                                  
/home/mellow/.config/nvim/after/plugin/telescope.lua:vim.keymap.set('n', '<leader>ff', builtin.find_files, {})                
/home/mellow/.config/nvim/after/plugin/telescope.lua:vim.keymap.set('n', '<C-p>', builtin.git_files, {})

```
## Color Scheme

We're going for the rose pine.
https://github.com/rose-pine/neovim
