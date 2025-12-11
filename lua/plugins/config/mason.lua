local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local nlspsettings = require("nlspsettings")

-- nlspsettings
nlspsettings.setup({
    config_home = vim.fn.stdpath('config') .. '/nlsp-settings',
    local_settings_dir = ".nlsp-settings",
    local_settings_root_markers_fallback = { ".git" },
    append_default_schemas = true,
    loader = "json",
})

-- on_attach
local function on_attach(client, bufnr)
    vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"

    if client.server_capabilities.inlayHintProvider then
        local group = vim.api.nvim_create_augroup("InlayHints", { clear = true })

        local mode = vim.api.nvim_get_mode().mode
        vim.lsp.inlay_hint.enable(mode == "n" or mode == "v", { bufnr = bufnr })

        vim.api.nvim_create_autocmd("InsertEnter", {
            group = group,
            buffer = bufnr,
            callback = function()
                vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
            end,
        })
    end
end

-- Capabilities
local caps = vim.lsp.protocol.make_client_capabilities()
caps.textDocument.completion.completionItem.snippetSupport = true

-- Default config for all servers
vim.lsp.config("*", {
    capabilities = caps,
    on_attach = on_attach,
})

-- Mason
mason.setup()
mason_lspconfig.setup({ automatic_installation = false })

-- Setup per-server configs
for _, server in ipairs(mason_lspconfig.get_installed_servers()) do
    local cfg = {}

    -- === Modern Vue + TypeScript Integration ===
    if server == "vtsls" then
        local vue_language_server_path =
            vim.fn.stdpath("data") .. "/mason/packages/vue-language-server/node_modules/@vue/language-server"

        local vue_plugin = {
            name = "@vue/typescript-plugin",
            location = vue_language_server_path,
            languages = { "vue" },
            configNamespace = "typescript",
        }

        cfg.settings = {
            vtsls = {
                tsserver = {
                    globalPlugins = { vue_plugin },
                },
            },
        }

        cfg.filetypes = {
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
            "vue",
        }

    elseif server == "vue_ls" then
        local vue_language_server_path =
            vim.fn.stdpath("data") .. "/mason/packages/vue-language-server/node_modules/@vue/language-server"

        cfg.init_options = {
            typescript = {
                tsdk = vue_language_server_path .. "/node_modules/typescript/lib",
            },
        }

        cfg.filetypes = { "vue" }
    end

    -- Apply config
    vim.lsp.config(server, cfg)

    -- Enable
    vim.lsp.enable(server)
end
