local dashboard = require("dashboard")

dashboard.setup({
    -- theme = "doom",
    theme = "hyper",
    -- config = {
    --     header = {"hi, rain"},
    -- }
    config = {
        header = { 
            '',
            '',
            ' ██╗   ██╗ ████╗       █████████╗    ████╗   ████╗ ███╗   ██╗',
            ' ██║   ██║  ██╔╝       ╚██╔═══██║   ██╔═██╗   ██╔╝ ████╗  ██║',
            ' ████████║  ██║         ████████║  ██═╝ ╚██╗  ██║  ██╔██╗ ██║',
            ' ██╔═══██║  ██║   ██╗   ██╔══██╔╝  ████████║  ██║  ██║╚██╗██║',
            ' ██║   ██║ ████╗  ╚█║  ███║  ╚═██╗ ██╔═══██║ ████╗ ██║ ╚████║',
            ' ╚═╝   ╚═╝ ╚═══╝   ╚╝  ╚══╝    ╚═╝ ╚═╝   ╚═╝ ╚═══╝ ╚═╝  ╚═══╝',
            -- ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
            -- ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
            -- ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
            -- ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
            -- ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
            -- ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
        },  --your header

        -- week_header = {
        --     enable = false,
        --     concat = "test",
        --     append = {"hi", "rain"},
        -- },
        vertical_center = true,
        center = {
            {
                icon = ' ',
                icon_hl = 'Title',
                desc = 'Find File           ',
                desc_hl = 'String',
                key = 'b',
                keymap = 'SPC f f',
                key_hl = 'Number',
                key_format = ' %s', -- remove default surrounding `[]`
                action = 'lua print(2)'
            },
        -- },
            {
                icon = ' ',
                desc = 'Find Dotfiles',
                key = 'f',
                keymap = 'SPC f d',
                key_format = ' %s', -- remove default surrounding `[]`
                action = 'lua print(3)'
            },
        },
        footer = {
            "        ",
            -- "Hi, Rain",
            "Powered by NeoVim",
        },  --your footer
    }
})
