local lsp_zero = require("lsp-zero")

lsp_zero.preset("recommended")

lsp_zero.on_attach(function(client, bufnr)
    lsp_zero.default_keymaps({bufnr = bufnr})
end)

require("mason").setup({})
require("mason-lspconfig").setup({
    ensure_installed = {"jedi_language_server"},
    handlers = {
        lsp_zero.default_setup,
        jedi_language_server = function()
            require("lspconfig").jedi_language_server.setup({
                settings = {
                    completions = {
                        fuzzy = true
                    }
                }
            })
        end,
    },
})

local cmp = require("cmp")
cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ["<CR>"] = cmp.mapping.confirm({select = true}),
    }),
    matching = {
        disallow_fuzzy_matching = false,
    }
})
--local cmp_select = {behavior = cmp.SelectBehavior.Select}
--local cmp_mappings = lsp_zero.defaults.cmp_mappings({
--    ["<C-y>"] = cmp.mapping.confirm({ select = true }),
--    ["<C-Space>"] = cmp.mapping.complete(),
--})
