local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>pf', function()
    -- Show symlinks and hidden files
    local opts = {follow = true, hidden = true}
    builtin.find_files(opts)
end, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
