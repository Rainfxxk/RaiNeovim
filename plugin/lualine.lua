require("lualine").setup({
    options = {
        globalstatus = true,
        theme = "auto",
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' }
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
        lualine_a = {
            {
                'mode', icon = '',
                separator = { left = '', right = '' },
            }
        },
        lualine_z = {
            {
                'location',
                separator = { left = '', right = '' },
                left_padding = 0
            }
        },
    },
})
