vim.o.laststatus = 0

local function tab_has_horizontal_split()
    local layout = vim.fn.winlayout()
    local function has_row(node)
        if node[1] == 'col' then
            return true
        elseif node[1] == 'leaf' then
            return false
        else
            for _, child in ipairs(node[2]) do
                if has_row(child) == true then return true end
            end
            return false
        end
    end
    return has_row(layout)
end

-- 使用
vim.api.nvim_create_autocmd({ "WinNew", "WinClosed" }, {
    pattern = "*",
    callback = function()
        if tab_has_horizontal_split() then
            vim.o.laststatus = 3
        else
            vim.o.laststatus = 0
        end
    end,
})
