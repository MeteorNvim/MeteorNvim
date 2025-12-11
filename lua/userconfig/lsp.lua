-- Setup lspconfig if Mason.nvim doesn't support current platform.

local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- The attach function I use in require('mason-lspconfig').setup_handlers
local on_attach = function(client, buf)
    -- Enable inlay hints if the client supports it.
    if client.server_capabilities.inlayHintProvider then
        local inlay_hints_group = vim.api.nvim_create_augroup('InlayHints', { clear = true })

        -- Initial inlay hint display.
        local mode = vim.api.nvim_get_mode().mode
        vim.lsp.inlay_hint.enable(mode == 'n' or mode == 'v', {bufnr = buf})

        vim.api.nvim_create_autocmd('InsertEnter', {
            group = inlay_hints_group,
            buffer = buf,
            callback = function()
                vim.lsp.inlay_hint.enable(true, {
                  bufnr = buf
                })
            end,
        })
        vim.api.nvim_create_autocmd('InsertLeave', {
            group = inlay_hints_group,
            buffer = buf,
            callback = function()
                -- vim.lsp.inlay_hint(buf, true)
            end,
        })
    end
end

-- Here add your lsp
-- Example (NEW API for Neovim 0.11+):

-- Define the configuration:
-- vim.lsp.config('rust_analyzer', {
--   capabilities = capabilities,
--   on_attach = on_attach,
-- })
--
-- -- Enable the server:
-- vim.lsp.enable('rust_analyzer')
