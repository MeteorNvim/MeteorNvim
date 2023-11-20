-- Setup lspconfig if Mason.nvim doesn't support current platform.

local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- The attach function I use in require('mason-lspconfig').setup_handlers
local on_attach = function(client, buf)
    -- Enable inlay hints if the client supports it.
    if client.server_capabilities.inlayHintProvider then
        local inlay_hints_group = vim.api.nvim_create_augroup('InlayHints', { clear = true })

        -- Initial inlay hint display.
        local mode = vim.api.nvim_get_mode().mode
        vim.lsp.inlay_hint(buf, mode == 'n' or mode == 'v')

        vim.api.nvim_create_autocmd('InsertEnter', {
            group = inlay_hints_group,
            buffer = buf,
            callback = function()
                vim.lsp.inlay_hint(buf, true)
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

-- Example:
-- require('lspconfig')['rust_analyzer'].setup {
--   capabilities = capabilities,
--   on_attach = on_attach
-- }
