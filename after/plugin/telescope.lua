--github instructions on telescope usage
--https://github.com/nvim-telescope/telescope.nvim

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>ps', builtin.live_grep, {})

vim.keymap.set('n', '<leader>*', builtin.grep_string, {})


-- not sure I want to keep this in because it seems superfluous with the above command?
vim.keymap.set('n', '<leader>pg', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)


