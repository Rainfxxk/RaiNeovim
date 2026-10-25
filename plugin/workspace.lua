local ok, workspace = pcall(require, "workspace")

if not ok then
    vim.notify("workspace.nvim failed to load: " .. tostring(workspace), vim.log.levels.ERROR)
    return
end

workspace.setup({
    -- default: inherit the current workspace cwd for new tabs
    new_tab_cwd = "inherit",
    -- use the built-in tabline only when no custom tabline is configured
    tabline = { enabled = "auto" },
    close = {
        delete_unmodified = true,
        modified = "prompt",
        notify = true,
    },
    session = {
        enabled = true,
    },
})
