local oil = require("oil")

local enter_dir = function()
    local entry = oil.get_cursor_entry()
    if (entry == nil) then return end
    if (entry.type == "directory") then oil.select() end
end

oil.setup {
    columns = {
        "icon",
        "size",
        "permissions",
        "ctime",
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
        ["?"]     = {"actions.show_help", mode = "n" },
        ["<ESC>"] = {"actions.close", mode = "n"},
        ["q"]     = {"actions.close", mode = "n"},
        ["<s-h>"] = {"actions.parent", mode = "n"},
        ["<s-l>"] = {enter_dir, mode = "n"}
    },
    preview_win = {
        win_options = {
            relativenumber = true,
            wrap = false,
        },
    },
    view_options = {
        show_hidden = true,
    }
}
