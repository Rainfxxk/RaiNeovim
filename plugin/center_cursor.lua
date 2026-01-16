local M = {}
M.enable = false
M.enable_cursor_center = function ()
    vim.cmd("normal! zz")
    M.autocmd_id = vim.api.nvim_create_autocmd({"CursorMoved", "CursorMovedC"}, {
        callback = function ()
            vim.cmd("normal! zz")
        end
    })
end

M.disable_cursor_center = function ()
    if (M.autocmd_id) then
        vim.api.nvim_del_autocmd(M.autocmd_id)
    end
end

M.toggle_cursor_center = function ()
    if (M.enable) then
        M.disable_cursor_center()
        M.enable = false
    else
        M.enable_cursor_center()
        M.enable = true
    end
end

vim.api.nvim_create_user_command(
    "ToggleCursorCenter",
    M.toggle_cursor_center,
    { desc = "Toggle Cursor Center"}
)

vim.api.nvim_create_user_command(
    "EnableCursorCenter",
    M.enable_cursor_center,
    { desc = "Enable Cursor Center"}
)

vim.api.nvim_create_user_command(
    "DisableCursorCenter",
    M.disable_cursor_center,
    { desc = "Disable Cursor Center"}
)
