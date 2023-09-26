print("huh?")
-- show line numbers
vim.opt.nu = true
-- show line numbers relative to current line
vim.opt.relativenumber = true
-- ignore case when searching
vim.opt.ic = true
-- nnoremap <C-R> :sp <CR> :term python % <CR>

--larger cursor?
vim.opt.guicursor = ""

-- four character tabs
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

--not sure how this is different than the usual search
vim.opt.incsearch = true

