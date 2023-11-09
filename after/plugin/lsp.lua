local lsp_zero = require("lsp-zero")
lsp_zero.extend_lspconfig()
lsp_zero.preset("recommended")

lsp_zero.on_attach(function(client, bufnr)
    lsp_zero.default_keymaps({bufnr = bufnr})

    local nmap = function(keys, func, desc)
        if desc then
            desc = "LSP: " .. desc
        end

        vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
    end

    -- is there a reason I did these two differently?
    -- yes - it's because of the arguments I wanted to pass to the functions, which I didn't need with lsp_document_symbols
    nmap("<leader>py", function() require("telescope.builtin").lsp_workspace_symbols({fname_width = 60}) end, "[P]roject [S]ymbols")
    nmap("<leader>dy", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
    nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
    --not sure if this one is necessary, other than to provide the description to help
    nmap("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")

    --nmap("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
    --nmap("<leader>ds", function() require("telescope.builtin").lsp_document_symbols({symbol_width = 30}) end, "[D]ocument [S]ymbols")

    --vim.keymap.set("n", "<leader>ds", function() vim.lsp.buf.document_symbol() end, opts)
    --vim.keymap.set("n", "<leader>ps", function() vim.lsp.buf.workspace_symbol() "[W]orkspace [S]ymbols", end, opts)


--[[
these are some other commands not yet implemented from documentation
https://github.com/nvim-lua/kickstart.nvim/blob/master/init.lua
https://github.com/VonHeikemen/lsp-zero.nvim

nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

  nmap('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
  nmap('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

  -- See `:help K` for why this keymap
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })
end

--]]

end)

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = { "pyright", "html" },
})
require("lspconfig").pyright.setup{}
require("lspconfig").html.setup{}

--
local cmp = require("cmp")
cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ["<CR>"] = cmp.mapping.confirm({select = true}),
        ["<C-Space"] = cmp.mapping.complete(),
    }),
})
--local cmp_select = {behavior = cmp.SelectBehavior.Select}
-- local cmp_mappings = lsp.defaults.cmp_mappings({
--    ["<C-y>"] = cmp.mapping.confirm({ select = true }),
--    ["<C-Space>"] = cmp.mapping.complete(),
-- })
