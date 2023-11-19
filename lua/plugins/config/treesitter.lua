-- Treesitter
require'nvim-treesitter.configs'.setup {
    ensure_installed = {"html", "css", "javascript", "typescript", "c", "cpp", "rust", "vue", "tsx", "go", "python"},
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    }
  }
