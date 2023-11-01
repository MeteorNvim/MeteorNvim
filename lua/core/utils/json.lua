--- Module for reading and modifying JSON configuration in Neovim.
local M = {}

--- Neovim configuration path
local config_path = vim.fn.stdpath('config')
--- Json file path
local path = string.format("%s/settings.json", config_path)

--- Get the value associated with a specified object in the JSON configuration.
---
--- @param object string: The object key to retrieve.
--- @return string: The value associated with the specified object.
function M.getValue(object)
    local handle = io.popen(string.format("jq -r '.%s' %s", object, path))
    if handle then
        local result = handle:read('*a')
        result = result:gsub("%s+", "")
        handle:close()
        return result
    else
        return "error"
    end
end

--- Set the value of a specified object in the JSON configuration.
---
--- @param object string: The object key to set.
--- @param value string: The value to assign to the object key.
function M.setValue(object, value)
    local temp_file = os.tmpname()
    local tmp_file = io.open(temp_file, 'w')

    if tmp_file then
        local jq_command = string.format('jq \'.%s = "%s"\' %s > %s', object, value, path, temp_file)
        os.execute(jq_command)

        os.execute(string.format("mv %s %s", temp_file, path))
    end
end

function M.getFields(object)
    local cmd = string.format("jq -r '.%s | keys[]' %s", object, path)
    local handle = io.popen(cmd)
    local result = {}

    if handle then
        for line in handle:lines() do
            if line ~= "" then
                table.insert(result, line)
            end
        end
        handle:close()
    end

    return result
end


--- Parse a string containing Lua tables and convert it into a Lua table.
---
--- @param str string: The input string to parse.
--- @return table: The parsed Lua table.
function M.parseTable(object)
    local cmd = string.format("jq -r '.%s | values[]' %s", object, path)
    local handle = io.popen(cmd)
    local result = {}

    if handle then
        local jsonString = handle:read('*a')
        for line in jsonString:gmatch("%b[]") do
            -- Eliminate brackets [ ] and split the string into elements
            local elements = line:sub(2, -2):gsub("[\n\r]+", ""):gsub("%s+", " "):match("%s*(.-)%s*$")
    
            -- Split the elements by commas
            local tableElements = {}
            for element in elements:gmatch("%s*([^,]+)%s*") do
                tableElements[#tableElements + 1] = element:match('^"(.*)"$')
            end
    
            table.insert(result, tableElements)
        end
    end
    

    return result
end

--- Parse a string containing Lua tables and convert it into a Lua table.
---
--- @param str string: The input string to parse.
--- @return table: The parsed Lua table.
function M.parseTableWithoutEscapeChars(object)
    local cmd = string.format([[jq -r '.%s | values[] | map(gsub("[\\n\\t\\\"]"; ""))' %s]], object, path)
    local handle = io.popen(cmd)
    local result = {}

    if handle then
        local jsonString = handle:read('*a')
        for line in jsonString:gmatch("%b[]") do
            -- Eliminate brackets [ ] and split the string into elements
            local elements = line:sub(2, -2):gsub("[\n\r]+", ""):gsub("%s+", " "):match("%s*(.-)%s*$")
    
            -- Split the elements by commas
            local tableElements = {}
            for element in elements:gmatch("%s*([^,]+)%s*") do
                tableElements[#tableElements + 1] = element:match('^"(.*)"$')
            end
    
            table.insert(result, tableElements)
        end
    end
    

    return result
end

-- Convert json string to boolean
M.strtobool={ ["true"]=true, ["false"]=false }


return M
