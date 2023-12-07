-- Import the 'mason' and 'mason-lspconfig' Lua modules
local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")

-- Import necessary Neovim Lua modules
local lspconfig = require("lspconfig")
local nlspsettings = require("nlspsettings")

-- Configure the 'nlspsettings' plugin
nlspsettings.setup({
    config_home = vim.fn.stdpath('config') .. '/nlsp-settings',
    local_settings_dir = ".nlsp-settings",
    local_settings_root_markers_fallback = { '.git' },
    append_default_schemas = true,
    loader = 'json'
})

-- Define an 'on_attach' function for LSP clients
function on_attach(client, bufnr)
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Check if the LSP server supports inlay hints and configure their display
    if client.server_capabilities.inlayHintProvider then
        local inlay_hints_group = vim.api.nvim_create_augroup('InlayHints', { clear = true })

        -- Initial inlay hint display.
        local mode = vim.api.nvim_get_mode().mode
        vim.lsp.inlay_hint.enable(bufnr, mode == 'n' or mode == 'v')

        -- Display inlay hints when entering insert mode
        vim.api.nvim_create_autocmd('InsertEnter', {
            group = inlay_hints_group,
            buffer = bufnr,
            callback = function()
                vim.lsp.inlay_hint.enable(bufnr, true)
            end,
        })
    end
end

-- Define global capabilities for LSP clients
local global_capabilities = vim.lsp.protocol.make_client_capabilities()
global_capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Override the default LSP configuration to set the global capabilities
lspconfig.util.default_config = vim.tbl_extend("force", lspconfig.util.default_config, {
    capabilities = global_capabilities,
})

-- Set up the 'mason' plugin
mason.setup()

-- Set up the 'mason-lspconfig' plugin
mason_lspconfig.setup()

-- Set up handlers for LSP servers and attach the 'on_attach' function
mason_lspconfig.setup_handlers({
    function(server_name)
        lspconfig[server_name].setup({
            on_attach = on_attach
        })
    end
})
