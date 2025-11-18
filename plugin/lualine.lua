require("lualine").setup({
    options = {
        globalstatus = true,
        theme = "auto",
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' }
    },
    sections = {
        lualine_a = {
            {
                'mode',
                icon = '',
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
    }
})
