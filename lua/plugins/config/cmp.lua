local cmp = require('cmp')

-- Define icons for different code item kinds
local kind_icons = {
    Text = '  ',
    Method = '  ',
    Function = '  ',
    Constructor = '  ',
    Field = '  ',
    Variable = '  ',
    Class = '  ',
    Interface = '  ',
    Module = '  ',
    Property = '  ',
    Unit = '  ',
    Value = '  ',
    Enum = '  ',
    Keyword = '  ',
    Snippet = '  ',
    Color = '  ',
    File = '  ',
    Reference = '  ',
    Folder = '  ',
    EnumMember = '  ',
    Constant = '  ',
    Struct = '  ',
    Event = '  ',
    Operator = '  ',
    TypeParameter = '  ',
    TabNine = "󰹻"
}

cmp.setup({
    formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
            -- Kind icons
            vim_item.kind = string.format('%s', kind_icons[vim_item.kind])
            -- Source
            vim_item.menu = ({
                buffer = "",
                nvim_lsp = "",
                luasnip = "",
                nvim_lua = "",
                cmp_tabnine = "",
                latex_symbols = "",
            })[entry.source.name]
            return vim_item
        end
    },
    window = {
        documentation = {
            max_height = 20
        }
    },
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    mapping = {
        ['<C-ScrollWheelUp>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        ['<C-ScrollWheelDown>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),

        ['<Tab>'] = function(fallback)
            if not cmp.select_next_item() then
                fallback()
            end
        end,

        ['<Down>'] = function(fallback)
            if not cmp.select_next_item() then
                fallback()
            end
        end,

        ['<ScrollWheelDown>'] = function(fallback)
            if not cmp.select_next_item() then
                fallback()
            end
        end,

        ['<S-Tab>'] = function(fallback)
            if not cmp.select_prev_item() then
                fallback()
            end
        end,

        ['<ScrollWheelUp>'] = function(fallback)
            if not cmp.select_prev_item() then
                fallback()
            end
        end,

        ['<Up>'] = function(fallback)
            if not cmp.select_prev_item() then
                fallback()
            end
        end,

        ['<ESC>'] = function(fallback)
            if cmp.visible() then
                cmp.close()
            else
                fallback()
            end
        end,

    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    }, {
        { name = 'buffer' },
        { name = "crates" },
        { name = 'nvim_lsp_signature_help' },
        { name = 'cmp_tabnine' },
    })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
    sources = cmp.config.sources({
        { name = 'nvim_lsp_document_symbol' }
    }, {
        { name = 'buffer' }
    })
})
-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})

-- Load vscode snippets
require("luasnip.loaders.from_vscode").lazy_load()