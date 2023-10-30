local M = {}

function M.get_installed_colorschemes()
    local installed_colorschemes = {}

    -- Get the current background and color scheme
    local before_background = vim.o.background
    local before_color = vim.api.nvim_exec("colorscheme", true)

    -- Get a list of available colorschemes
    local available_colors = vim.fn.getcompletion("", "color")

    -- Ensure the current colorscheme is included in the list
    if not vim.tbl_contains(available_colors, before_color) then
        table.insert(available_colors, 1, before_color)
    end

    -- Filter out duplicates and add them to the installed_colorschemes table
    for _, color in ipairs(available_colors) do
        if not vim.tbl_contains(installed_colorschemes, color) then
            table.insert(installed_colorschemes, color)
        end
    end

    -- Restore the original background and colorscheme
    vim.o.background = before_background
    vim.cmd("colorscheme " .. before_color)

    return installed_colorschemes
end

return M