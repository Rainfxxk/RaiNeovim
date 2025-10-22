local oil = require("oil")

oil.setup {
    columns = {
        "icon",
        -- "permissions",
        -- "size",
        -- "mtime",
    },
    float = {
        max_width = 0.9,
        max_height = 0.9,
        border = {"┌", "─", "┐", "│", "┘", "─", "└", "│"},
    },
    keymaps_help = {
        border = {"┌", "─", "┐", "│", "┘", "─", "└", "│"},
    },
    keymaps = {
        ["?"] = { "actions.show_help", mode = "n" },
        ["<ESC>"] = {"actions.close", mode = "n"},
        ["q"] = {"actions.close", mode = "n"},
        ["<s-h>"] = {"actions.parent", mode = "n"},
        ["<s-l>"] = { 
            function()
                entry = oil.get_cursor_entry()
                if (entry == nil) then return end
                if (entry.type == "directory") then oil.select() end
            end, mode = "n"}
    },
    preview_win = {
        win_options = {
            relativenumber = true,
            wrap = false,
        },
    },
}
