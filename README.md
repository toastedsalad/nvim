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
    * To get the full extent of its capabilities you should install your language's config for treesitter.
    * For .net it is called "c_sharp"

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

### Install your choice of LSP. This is omnisharp.
Install and configure the LSP for Vim. The getting started guide is pretty good and will get you going.
We're not using lsp-zero as that is an overhead our setup does not require.

When the time comes to configure the Lsp, you will need to provide the following as the server:

```
require('lspconfig').omnisharp.setup{
cmd = { "dotnet", "/home/mellow/.config/nvim/omnisharp/OmniSharp.dll" },
}
```
### Or csharp-ls
https://github.com/razzmatazz/csharp-language-server
This thing is written by an absolute chad Lithuanian dude. Respekt. Teting it out now.
It is based on roslyn.

3. Additional extensions for the omnisharp functionality are here. I've noticed that I couldn't check all references. Maybe this fixes it somehow. At the moment I did not find a way to set it all up but here is a good doc from lazy vim about developing for .net. It actually suggests using the extended omnisharp ls https://www.lazyvim.org/extras/lang/omnisharp

### Or roslyn.nvim
Which apparetnly the latest and greatest lsp for .net currently used in vscode.
But it is also based on Roslyn so idk if this is in any way
https://github.com/jmederosalvarado/roslyn.nvim
Maybe I should test this out at some point, but charp-ls is quite good atm.

https://github.com/jmederosalvarado/roslyn.nvim

## Formatters and linting
charpier is available from mason but I'm not sure how to set it up.
I might need another plugin to drive the formatting. Perhaps this... But linting is not a priority now.
https://github.com/mfussenegger/nvim-lint
https://github.com/stevearc/conform.nvim
https://github.com/stevearc/conform.nvim/issues/379

## Debugging
There is some debugging support for .net as well but how does it all pipe together is to be tested.
Here are the resources.
https://aaronbos.dev/posts/debugging-csharp-neovim-nvim-dap
https://github.com/Samsung/netcoredbg you heard it right the debug adapter for csharp is written by Samsung.
https://www.youtube.com/watch?v=lyNfnI-B640

This setup generally, works out pretty fine. It almost feels like it's all coming together. Except for one thing. Testing...

## Testing
Running and debugging tests in VS is very smooth.
If there's a way to resemble some of that experience it would be super nice.
Here's someone who tried solving this:
https://github.com/GustavEikaas/easy-dotnet.nvim

Here's another plugin, says it has support for nunit and xunit.
https://github.com/Issafalcon/neotest-dotnet

It's all setup now. Tests are running babyyyy.

## Split Screen
Split screen is supported by default with :vsplit.
But the inactive screen looses transparency...

## Using tmux
tmux allows running multiple apps in the same terminal.
It provides multiplexing. Default installation is fine just make sure to add these to fix the colors:

Also using tmux somehow adds a delay to escaping to Normal mode. Settings bellow address that.
```
~$ cat .tmux.conf 
set -ga terminal-overrides ",*256col*:Tc"
set -g default-terminal "screen-256color"
set -sg escape-time 10
```

## Outstanding issues and tickets

* F10 button doesn't work. Or it does something that is not F10. Feels like an escape char.
    * Solved gnome terminal was interceptint this button. Solved by disabling mnemonics in the terminal preferences. 
* Somehow I can't do completion properly.
    * Solved with some remaps.
* Install lua lsp to help with configuration of neovim.
    * Solved
* What's the diff between /after and /lua directories.
    * Semi-solved: In very broad terms /after configs will be applied later.
* Solve path resolution for the debugger.
* Add rest of the keymaps. 
+ Solve the undefined global for vim.

