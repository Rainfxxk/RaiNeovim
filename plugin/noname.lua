-- 打开文件时，自动关闭上一个空的匿名 buffer（[No Name]）
local last_buffer

local function is_empty_noname(buf)
    if not vim.api.nvim_buf_is_loaded(buf) or not vim.bo[buf].buflisted then
        return false
    end
    if vim.bo[buf].buftype ~= "" or vim.bo[buf].modified then
        return false
    end
    if vim.api.nvim_buf_get_name(buf) ~= "" then
        return false
    end
    -- 空 buffer 的内容是 {""}，而不是空表
    local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
    return #lines == 1 and lines[1] == ""
end

vim.api.nvim_create_autocmd("BufLeave", {
    callback = function()
        local buf = vim.api.nvim_get_current_buf()
        last_buffer = is_empty_noname(buf) and buf or nil
    end,
})

vim.api.nvim_create_autocmd("BufEnter", {
    callback = function()
        local buf = last_buffer
        last_buffer = nil
        if not buf or buf == vim.api.nvim_get_current_buf() then
            return
        end
        if not vim.api.nvim_buf_is_valid(buf) or vim.bo[buf].modified then
            return
        end
        -- 仍显示在其它窗口（含其它 tab）时不动它
        local info = vim.fn.getbufinfo(buf)[1]
        if info and #info.windows > 0 then
            return
        end
        vim.api.nvim_buf_delete(buf, { force = false })
    end,
})
