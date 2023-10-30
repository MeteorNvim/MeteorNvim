require("core.mappings")
require("core.options")
require("core.lazy")

local json = require("core.utils.json")

vim.cmd(string.format("colorscheme %s", json.getValue("theme")))