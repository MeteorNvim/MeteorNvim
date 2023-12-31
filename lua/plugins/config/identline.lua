require("indent_blankline").setup {
    indentLine_enabled = 1,
    space_char_blankline = " ",
    filetype_exclude = {
        "dashboard",
        "lazy",
        "terminal",
        "help",
        "log",
        "markdown",
        "TelescopePrompt",
        "TelescopeResults",
        "lspinfo",
        "toggleterm",
        "NvimTree",
        "mason"
    },
    buftype_exclude = { "terminal", "lazy" },
    show_trailing_blankline_indent = false,
    show_first_indent_level = false,
    show_current_context = true,
}
