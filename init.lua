print("huh?")
-- show line numbers
vim.opt.nu = true
-- show line numbers relative to current line
vim.opt.relativenumber = true
-- ignore case when searching
vim.opt.ic = true
-- nnoremap <C-R> :sp <CR> :term python % <CR>

--larger cursor? - I may have done that incorrectly because it just makes the normal and insert cursors look the same
--vim.opt.guicursor = ""

-- four character tabs
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

--not sure how this is different than the usual search
vim.opt.incsearch = true


-- set <space>pv to pull up the Ex menu - not sure what "pv" means, but hey
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)



-- this section is to set up lazyvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- require my subdirectory with stuff in it?
require("mike_stuff")


