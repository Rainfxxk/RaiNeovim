local none_theme = { fg = "NONE", bg = "NONE" }
local theme = {}
local modes = { "normal", "inactive", "insert", "visual", "replace", "command", "terminal" }
for _, mode in ipairs(modes) do
    theme[mode] = {
      a = none_theme,
      b = none_theme,
      c = none_theme,
      x = none_theme,
      y = none_theme,
      z = none_theme,
    }
end

-- Attention chip from lua/claude.lua, empty unless Claude Code is waiting on
-- the user. Required lazily so a broken claude.lua cannot break the statusline.
local attention = function ()
    local ok, claude = pcall(require, "claude")
    if (ok and claude.enable) then return claude.statusline() end
    return ""
end

-- Current workspace.nvim workspace name; empty when the plugin is unavailable.
local workspace = function()
    local ok, workspace = pcall(require, "workspace")
    if not ok or not vim.g.loaded_workspace_nvim then return "" end
    local ws = workspace.current()
    return ws and ws.name or ""
end

require("lualine").setup({
    options = {
        globalstatus = true,
        -- theme = "auto",
        theme = theme,
        -- theme = "auto",
        section_separators = { left = '|', right = '|' },
        component_separators = { left = '|', right = '|' }
    },
    -- sections = {
    --     lualine_a = {
    --         {
    --             'mode', icon = '',
    --             separator = { left = '', right = '' },
    --         }
    --     },
    --     lualine_b = {
    --         {'branch', separator = { left = '', right = '' }},
    --         {'diff',   separator = { left = '', right = '' }},
    --         {'diagnostics'}
    --     },
    --     lualine_c = {
    --         'filename'
    --     },
    --     lualine_x = {
    --         'encoding', 'fileformat', 'filetype'
    --     },
    --     lualine_y = {
    --         'progress'
    --     },
    --     lualine_z = {
    --         'location'
    --     }
    --   },
    sections = {
        lualine_a = {{ 'mode', icon = '' }},
        lualine_b = { 'filename', 'diagnostics' },
        lualine_c = { 'branch', 'diff', workspace },
        lualine_x = { attention, 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'location' },
        lualine_z = { 'progress' },
    },
})
