require("core.mappings")
require("core.options")
require("core.lazy")
require("userconfig")

local json = require("core.utils.json")

vim.cmd(string.format("colorscheme %s", json.getValue("theme")))
vim.cmd("autocmd BufRead,BufNewFile,BufEnter * set formatoptions-=cro | stopinsert")