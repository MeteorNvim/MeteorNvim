vim.lsp.handlers["textDocument/publishDiagnostics"] =
    vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics,
                 {update_in_insert = true})

vim.lsp.handlers['textDocument/implementation'] = require'lsputil.locations'.implementation_handler

local lsputils = {
  float = {
    focusable = true,
    style = "minimal",
    border = "rounded",
    max_width = 80,
    max_height = 20,
  },
  diagnostic = {
    virtual_text = { spacing = 4, prefix = "●" },
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = {
      focusable = true,
      style = "minimal",
      border = "rounded",
    },
    close_events = {
      "CursorMoved",
      "CursorMovedI",
      "BufHidden",
      "InsertCharPre",
      "WinLeave",
      "InsertEnter",
      "InsertLeave"
    },
  },
}

local diagnostic_signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "" },
    { name = "DiagnosticSignInfo", text = "" },
  }
  for _, sign in ipairs(diagnostic_signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
  end

local vim_version = vim.version().minor

if vim_version >= 11 then
  vim.diagnostic.config({virtual_lines=true})
else
  vim.diagnostic.config(lsputils.diagnostic)
end

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, lsputils.float)
