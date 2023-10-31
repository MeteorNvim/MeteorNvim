require("core.mappings")
require("core.options")
require("core.lazy")
require("userconfig")

local json = require("core.utils.json")
local theme = json.getValue("theme")

if theme == "" then
    vim.cmd("colorscheme default")
else
    vim.cmd(string.format("colorscheme %s", theme))
end

vim.cmd("autocmd BufRead,BufNewFile,BufEnter * set formatoptions-=cro | stopinsert")