local colors = vim.api.nvim_get_hl(0, {name = "Todo"})

local component_colors = {
    a = { fg = colors.fg, bg = colors.bg },
    b = { fg = colors.fg, bg = colors.bg },
    -- c = { fg = colors.fg, bg = colors.bg },

    x = { fg = colors.fg, bg = colors.bg },
    -- y = { fg = colors.foreground, bg = colors.background },
    -- z = { fg = colors.foreground, bg = colors.background },
}
local theme = {
    normal = component_colors,
    insert = component_colors,
    visual = component_colors,
    replace = component_colors,
    command = component_colors,
    inactive = component_colors,
}

require("lualine").setup({
    options = {
        globalstatus = true,
        -- theme = theme,
    },
    -- options = {
    --     theme = "visual_studio_code",
    --     icons_enabled = true,
    --     component_separators = { left = "", right = "" },
    --     section_separators = { left = "", right = "" },
    --     disabled_filetypes = {},
    --     globalstatus = true,
    --     refresh = {
    --         statusline = 100,
    --     },
    -- },
    -- sections = require("visual_studio_code").get_lualine_sections(),
    -- sections = {
    --     lualine_a = {{color = "Todo", 'mode'}},
    --     lualine_b = {{color = "Todo", 'branch', 'diff', 'diagnostics'}},
    --     lualine_c = {{color = "Todo", 'filename'}},
    --     lualine_x = {{color = "Todo", 'encoding', 'fileformat', 'filetype'}},
    --     lualine_y = {{color = "Todo", 'progress'}},
    --     lualine_z = {{color = "Todo", 'location'}}
    -- }
})
