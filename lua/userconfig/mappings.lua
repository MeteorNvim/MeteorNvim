-- Create a table for storing functions and mappings
local M = {}

-- Set leader key
vim.g.mapleader = " "

-- Define a function to set key mappings
M.map = function(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        -- If additional options are provided, merge them with the default options
        options = vim.tbl_extend("force", options, opts)
    end
    -- Use the Neovim API to set key mappings
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Load clipboard functions
require("core.utils.clipboard")

-- Themes
M.map('n', '<Leader>t', ':Telescope theme_switcher<CR>', { noremap = true, silent = true })

-- Hover
M.map('n', '<Leader>h', ':lua vim.lsp.buf.hover()<CR>', { noremap = true, silent = true })

-- Signature Help
M.map('n', '<Leader>s', ':lua vim.lsp.buf.signature_help()<CR>', { noremap = true, silent = true })

-- Signature Help
M.map('n', '<Leader>l', ':noh<CR>', { noremap = true, silent = true })

-- Signature Help
M.map('n', '<Leader>f', ':noh<CR>', { noremap = true, silent = true })

-- Code actions
M.map('n', '<Leader>c', ":lua require('telescope').extensions.code_actions.code_actions()<CR>", { noremap = true, silent = true })

-- NvimTree
M.map("n", "<C-B>", "<CMD>:NvimTreeToggle<CR>")
M.map("i", "<C-B>", "<CMD>:NvimTreeToggle<CR>")

-- Terminal
M.map('n', "<C-t>", "<CMD>:terminal<CR>", { silent = true })
M.map('i', "<C-t>", "<CMD>:terminal<CR>", { silent = true })

-- Ctrl+Delete
M.map("i", "<C-BS>", "<C-w>")
M.map("i", "<C-h>", "<C-w>")

-- Splits
M.map("n", "<leader>sv", ":vsp<CR>", { noremap = true })
M.map("n", "<leader>sh", ":sp<CR>", { noremap = true })

-- Clipboard Copy
M.map("v", "<C-C>", "y:lua ClipboardYank()<cr>gv", {silent = true} )
M.map("n", "<C-C>", "yy:lua ClipboardYank()<cr>", {silent = true})
M.map("i", "<C-C>", "<c-o>yy<c-o>:lua ClipboardYank()<cr>", {silent = true})

-- Clipboard Cut
M.map("v", "<C-X>", "x:lua ClipboardYank()<cr>", {silent = true} )
M.map("n", "<C-X>", "dd:lua ClipboardYank()<cr>", {silent = true})
M.map("i", "<C-X>", "<c-o>dd<c-o>:lua ClipboardYank()<cr>", {silent = true})

-- Clipboard Paste
M.map("", "<C-V>", ":lua ClipboardPaste()<cr>p", {silent = true})
M.map("c", "<C-V>", "<C-R>+")
vim.cmd("exe 'inoremap <script> <C-V>' paste#paste_cmd['i']")
vim.cmd("exe 'vnoremap <script> <C-V>' paste#paste_cmd['v']")

-- Undo
M.map("n", "<C-Z>", ":u<CR>")
M.map("i", "<C-Z>", "<c-o>:u<CR>")
M.map("v", "<C-Z>", "<ESC> :u<CR>")

-- Redo
M.map("n", "<C-Y>", ":redo<CR>")
M.map("i", "<C-Y>", "<c-o>:redo<CR>")
M.map("v", "<C-Y>", "<ESC> :redo<CR>")

-- Select all
M.map("n", "<C-A>", "ggVG", {silent = true})
M.map("i", "<C-A>", "<c-o>gg<c-o>VG<cr>", {silent = true})

-- Save
M.map("n", "<C-S>", [[:retab | :w!<CR>]])
M.map("i", "<C-S>", [[<c-o>:retab | :w!<CR>]])

-- Move Selection
M.map("v", "<TAB>", ">gv")
M.map("v", "<S-TAB>", "<gv")

-- Delete in election mode
M.map("v", "<BS>", [["_d]])

-- Delete without save in the clipboard
M.map("n", "<C-K>", [["_dd]])
M.map("i", "<C-K>", [[<c-o>"_dd]])
M.map("v", "<C-K>", [["_d]])

-- Bufferline next/prev
M.map("n", "<C-PageDown>", ":BufferLineCycleNext<CR>")
M.map("i", "<C-PageDown>", "<c-o>:BufferLineCycleNext<CR>")

M.map("n", "<C-PageUp>", ":BufferLineCyclePrev<CR>")
M.map("i", "<C-PageUp>", "<c-o>:BufferLineCyclePrev<CR>")

-- Bufferline move tab
M.map("n", "<C-ScrollWheelUp>", ":BufferLineMoveNext<CR>")
M.map("i", "<C-ScrollWheelUp>", "<c-o>:BufferLineMoveNext<CR>")

M.map("n", "<C-ScrollWheelDown>", ":BufferLineMovePrev<CR>")
M.map("i", "<C-ScrollWheelDown>", "<c-o>:BufferLineMovePrev<CR>")

-- Commenter (alacritty - gnome-terminal)
M.map("n", "<C-_>", ":CommentToggle<CR>")
M.map("i", "<C-_>", "<c-o>:CommentToggle<CR>")
M.map("v", "<C-_>", ":'<,'>CommentToggle<CR>")

-- Commenter (kitty - xterm)
M.map("n", "<C-7>", ":CommentToggle<CR>")
M.map("i", "<C-7>", "<c-o>:CommentToggle<CR>")
M.map("v", "<C-7>", ":'<,'>CommentToggle<CR>")

-- Search
M.map("n", "<C-f>", [[:SearchBoxMatchAll title="Search"<cr>]])
M.map("i", "<C-f>", [[<ESC>:SearchBoxMatchAll title="Search"<cr>]])
M.map("x", "<C-f>", [[:SearchBoxMatchAll title="Search" visual_mode=true <cr>]])

-- Move lines
M.map("n", "<C-Down>", ":m .+1<CR>==")
M.map("n", "<C-Up>", ":m .-2<CR>==")

M.map("i", "<C-Down>", "<Esc>:m .+1<CR>==gi")
M.map("i", "<C-Up>", "<Esc>:m .-2<CR>==gi")

M.map("v", "<C-Down>", ":m '>+1<CR>gv=gv")
M.map("v", "<C-Up>", ":m '<-2<CR>gv=gv")

return M