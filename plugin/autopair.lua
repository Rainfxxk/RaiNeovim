local pairs = {
    {'(', ')'},
    {'[', ']'},
    {'{', '}'},
    {'"'},
    {"'"},
}

local function register_single_pair_keymap(pair)
    local pair_char = pair[1]
    local single_pair_keymap = function()
        local cursor = vim.api.nvim_win_get_cursor(0)
        local row = cursor[1]
        local col = cursor[2]
        local line = vim.api.nvim_buf_get_lines(0, row - 1, row, false)[1]
        local char = string.sub(line, col + 1, col + 1)
        if char == pair_char then
            vim.api.nvim_win_set_cursor(0, {row, col + 1})
        else
            local prev = string.sub(line, 1, col)
            local tail = string.sub(line, col + 1, -1)
            local new_line = string.format("%s%s%s%s", prev, pair_char, pair_char, tail)
            vim.api.nvim_buf_set_lines(0, row - 1, row, false, {new_line})
            vim.api.nvim_win_set_cursor(0, {row, col + 1})
        end
    end

    vim.keymap.set('i', pair_char, single_pair_keymap)
end

local function register_pair_keymap(pair)
    local begin_pair = pair[1]
    local end_pair = pair[2]

    local begin_pair_func = function()
        --- @return integer[] # (row, col) tuple
        local cursor = vim.api.nvim_win_get_cursor(0)
        local row = cursor[1]
        local col = cursor[2]
        local line = vim.api.nvim_buf_get_lines(0, row - 1, row, false)[1]
        local prev = string.sub(line, 1, col)
        local tail = string.sub(line, col + 1, -1)
        local new_line = string.format("%s%s%s%s", prev, begin_pair, end_pair, tail)
        vim.api.nvim_buf_set_lines(0, row - 1, row, false, {new_line})
        vim.api.nvim_win_set_cursor(0, {row, col + 1})
    end

    local end_pair_func = function()
        --- @return integer[] # (row, col) tuple
        local cursor = vim.api.nvim_win_get_cursor(0)
        local row = cursor[1]
        local col = cursor[2]
        local line = vim.api.nvim_buf_get_lines(0, row - 1, row, false)[1]
        local char = string.sub(line, col + 1, col + 1)
        if char == end_pair then
            vim.api.nvim_win_set_cursor(0, {row, col + 1})
        else
            local prev = string.sub(line, 1, col)
            local tail = string.sub(line, col + 1, -1)
            local new_line = string.format("%s%s%s", prev, end_pair, tail)
            vim.api.nvim_buf_set_lines(0, row - 1, row, false, {new_line})
            vim.api.nvim_win_set_cursor(0, {row, col + 1})
        end
    end

    vim.keymap.set('i', begin_pair, begin_pair_func)
    vim.keymap.set('i', end_pair, end_pair_func)
end

for _, pair in ipairs(pairs) do
    if #pair == 1 then
        register_single_pair_keymap(pair)
    else
        register_pair_keymap(pair)
    end
end
