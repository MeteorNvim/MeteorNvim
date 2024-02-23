return {
    -- Autocomplete
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/nvim-cmp",
            "onsails/lspkind-nvim",
            "hrsh7th/cmp-nvim-lsp-signature-help",
            "hrsh7th/cmp-nvim-lsp-document-symbol"
        },
        config = function()
            require('plugins.config.cmp')
        end
    },

    -- Snippets
    {
        "L3MON4D3/LuaSnip",
        dependencies = {
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets"
        }
    },

    -- Syntax hightlight
    {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        config = function()
            require("plugins.config.treesitter")
        end
    },

    -- Nvim Comment
    {
        "terrortylor/nvim-comment",
        dependencies = {
            "JoosepAlviste/nvim-ts-context-commentstring"
        },
        config = function()
            require('plugins.config.nvim-comment')
        end
    },

    -- Trim on save
    {
        "cappyzawa/trim.nvim",
        config = function()
            require('trim').setup({
                patterns = {
                    [[%s/\s\+$//e]],
                    [[%s/\($\n\s*\)\+\%$//]],
                    [[%s/\%^\n\+//]],
                },
            })
        end
    },

    -- Autopairs
    {
        "windwp/nvim-autopairs",
        dependencies = {
            "tpope/vim-surround"
        },
        config = function()
            require('nvim-autopairs').setup()
        end
    },

    -- Identline
    {
        "lukas-reineke/indent-blankline.nvim",
        version = "2.20.7",
        config = function()
            require('plugins.config.identline')
        end
    },

    -- ToDo
    {
        "folke/todo-comments.nvim",
        config = function()
            require('plugins.config.todo')
        end
    },

    -- Fidget
    {
        "j-hui/fidget.nvim",
        tag = "legacy",
        config = function()
            require("fidget").setup()
        end
    },

    -- Color picker
    {
        "uga-rosa/ccc.nvim",
        config = function()
            require("plugins.config.color-picker")
        end
    },

    -- Formatter
    {
      "jay-babu/mason-null-ls.nvim",
      event = { "BufReadPre", "BufNewFile" },
      dependencies = {
        "williamboman/mason.nvim",
        "jose-elias-alvarez/null-ls.nvim",
      },
      config = function()
        require("plugins.config.null_ls")
      end,
    },
    {
      "sbdchd/neoformat"
    },

    -- Renamer
    {
      "filipdutescu/renamer.nvim",
      config = function ()
        require('renamer').setup()
      end
    },

    -- Git
    {
      "tpope/vim-fugitive"
    },
    {
      "tpope/vim-repeat"
    },
    {
      "mhinz/vim-signify"
    },

}
