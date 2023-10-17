--setup for colorscheme
--https://github.com/polirritmico/monokai-nightasty.nvim
--
vim.opt.background = "dark"
vim.opt.cursorline = true

require("monokai-nightasty").setup({
    dark_style_background = "transparent",
    
    color_headers = false,

    on_highlights = function(highlights, colors)
        highlights.TelescopeNormal = { fg = colors.magenta, bg = colors.charcoal }
    end,
})

vim.cmd([[colorscheme monokai-nightasty]])
