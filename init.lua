require("core.options")
require("userconfig")
require("core.lazy")

local json = require("core.utils.json")
local theme = json.getValue("theme")

if theme == "" then
    vim.cmd("colorscheme default")
else
    vim.cmd(string.format("colorscheme %s", theme))
end


vim.cmd("autocmd BufRead,BufNewFile,BufEnter * set formatoptions-=cro | stopinsert")
vim.cmd("autocmd TermOpen * setlocal nonumber norelativenumber")