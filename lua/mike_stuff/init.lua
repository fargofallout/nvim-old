-- packages to include
require("lazy").setup({{

    {'nvim-telescope/telescope.nvim', tag = '0.1.3',
    dependencies = { 'nvim-lua/plenary.nvim' }
},

{"nvim-treesitter/nvim-treesitter", build = ":TSUpdate",
    config = function () 
      local configs = require("nvim-treesitter.configs")
   end
   },

--sublime text theme
{"polirritmico/monokai-nightasty.nvim", lazy=false, priority=1000,},

--harpoon
{"ThePrimeagen/harpoon"},

--lsp-zero setup
{"williamboman/mason.nvim"},
{"williamboman/mason-lspconfig.nvim"},
{'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
{'neovim/nvim-lspconfig'},
{'hrsh7th/cmp-nvim-lsp'},
{'hrsh7th/nvim-cmp'},
{'L3MON4D3/LuaSnip'},


 }})

