-- Import the JSON library
local json = require("core.utils.json")

-- Check if the "leader" value in JSON is empty
if json.getValue("leader") == "" then
    -- Set the Vim global mapleader to a space character if "leader" is empty
    vim.g.mapleader = " "
else
    -- Set the Vim global mapleader to the value stored in JSON "leader" field
    vim.g.mapleader = json.getValue("leader")
end

-- Create a table for storing functions and mappings
local M = {}

-- Define a function to split a string into individual letters
function M.convertToLetters(inputString)
    local result = {}
    for i = 1, #inputString do
        local letter = inputString:sub(i, i)
        table.insert(result, letter)
    end
    return result
end

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

-- Iterate over an array of key mapping tables obtained from JSON
for _, maptable in ipairs(json.parseTable("maps")) do
    -- Extract the modes for the key mapping and split them into individual letters
    local modes = M.convertToLetters(maptable[1])
    for _, mode in ipairs(modes) do
        -- For each mode, set the key mapping with specified options
        M.map(mode, maptable[2], maptable[3], { silent = json.strtobool[maptable[4]] })
    end
end
