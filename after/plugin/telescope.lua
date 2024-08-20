local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>jj', builtin.find_files, {})
vim.keymap.set('n', '<leader>jk', builtin.git_files, {})
vim.keymap.set('n', '<leader>jl', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
