local dashboard = require("dashboard")

dashboard.setup({
    theme = "doom",
    -- theme = "hyper",
    hide = {
      statusline = true,       -- hide statusline default is true
      tabline = true,          -- hide the tabline
      winbar = true,           -- hide winbar
    },
    config = {
        border = {"┌", "─", "┐", "│", "┘", "─", "└", "│"},
        header = { 
            '',
            '┌──────────────────────┐',
            '│                      │',
            '│ │ ╲││ ╲╲╱╱ ││ │ ╲╱ │ │',
            '│ ││╲ │  ╲╱  ││ ││╲╱││ │',
            '│                      │',
            '└──────────────────────┘',
            '',
            -- '',
            -- '┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓',
            -- '┃                                                                ┃',
            -- '┃  ██╗   ██╗ ████╗       █████████╗    ████╗   ████╗ ███╗   ██╗  ┃',
            -- '┃  ██║   ██║  ██╔╝       ╚██╔═══██║   ██╔═██╗   ██╔╝ ████╗  ██║  ┃',
            -- '┃  ████████║  ██║         ████████║  ██═╝ ╚██╗  ██║  ██╔██╗ ██║  ┃',
            -- '┃  ██╔═══██║  ██║   ██╗   ██╔══██╔╝  ████████║  ██║  ██║╚██╗██║  ┃',
            -- '┃  ██║   ██║ ████╗  ╚█║  ███║  ╚═██╗ ██╔═══██║ ████╗ ██║ ╚████║  ┃',
            -- '┃  ╚═╝   ╚═╝ ╚═══╝   ╚╝  ╚══╝    ╚═╝ ╚═╝   ╚═╝ ╚═══╝ ╚═╝  ╚═══╝  ┃',
            -- '┃                                                                ┃',
            -- '┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛',
            -- '',
            -- '',
            -- ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
            -- ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
            -- ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
            -- ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
            -- ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
            -- ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
            -- '',
        },
        center = {
            {
                icon = ' ',
                icon_hl = 'Title',
                desc = 'Open File',
                desc_hl = 'String',
                key = 'y',
                keymap = 'SPC y',
                key_hl = 'Number',
                key_format = ' %s',
                action = ':Oil --float --preview'
            },
            {
                icon = '󰱼 ',
                icon_hl = 'Title',
                desc = 'Find File',
                desc_hl = 'String',
                key = 'f',
                keymap = 'SPC f f',
                key_hl = 'Number',
                key_format = ' %s',
                action = ':Telescope find_files'
            },
            {
                icon = '󰺯 ',
                icon_hl = 'Title',
                desc = 'Live Grep',
                desc_hl = 'String',
                key = 'g',
                keymap = 'SPC f g',
                key_hl = 'Number',
                key_format = ' %s',
                action = ':Telescope live_grep'
            },
            {
                icon = '󰈆 ',
                icon_hl = 'Title',
                desc = 'Quit Neovim          ',
                desc_hl = 'String',
                key = 'q',
                keymap = ':q',
                key_hl = 'Number',
                key_format = ' %s',
                action = ':q'
            },
        },
        packages = { enable = true },
        vertical_center = true,
        footer = {
            "Powered by NeoVim",
        },
    }
})
