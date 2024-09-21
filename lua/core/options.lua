-- Enable filetype plugins
vim.api.nvim_command("filetype plugin on")

-- Enable syntax highlighting
vim.api.nvim_command("syntax enable")

-- Set encoding to UTF-8
vim.opt.encoding = "UTF-8"

-- Enable clipboard integration with unnamedplus
vim.opt.clipboard = "unnamedplus"

-- Disable swap file creation
vim.opt.swapfile = false

-- Set scrolloff to 0
vim.opt.scrolloff = 0

-- Set tabstop, softtabstop, and shiftwidth to 4 spaces
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- Use spaces instead of tabs for indentation
vim.opt.expandtab = true

-- Enable autoindentation
vim.opt.autoindent = true

-- Set fileformat to Unix
vim.opt.fileformat = "unix"

-- Enable mouse support
vim.opt.mouse = "a"

-- Define keymodel
vim.opt.keymodel = {"startsel", "stopsel"}

-- Configure tabstop and shiftwidth to 2 spaces
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

-- Use spaces for indentation
vim.opt.expandtab = true

-- Set updatetime to 2000 milliseconds
vim.opt.updatetime = 2000

-- Enable true color support in terminal
vim.opt.termguicolors = true

-- Set the GUI font
vim.opt.guifont = "DroidSansMono Nerd Font:h11"

-- Display line numbers
vim.opt.number = true

-- Open new split windows below the current window
vim.opt.splitbelow = true

-- Set popup menu height
vim.opt.pumheight = 15

-- Set cmdline height
-- vim.opt.cmdheight = 0

-- Configure completion options
vim.opt.completeopt = {"menuone", "noinsert", "noselect"}

-- Set shortmess options
vim.opt.shortmess = "c"

-- Folding settings
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false
vim.opt.foldlevelstart = 99

-- Remove fill chars
vim.opt.fillchars = {eob = " "}
