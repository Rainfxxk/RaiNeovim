require("neo-tree").setup({
    close_if_last_window = true,
    statusline = true,
    filesystem = {
        visible = true, -- when true, they will just be displayed differently than normal items
        hide_dotfiles = false,
        hide_gitignored = false,
        -- hide_hidden = false, -- only works on Windows for hidden files/directories
    },
    default_component_configs = {
        indent = {
          with_markers = true,
          indent_marker = " ",
          last_indent_marker = "└",
          indent_size = 2,
        },
    },
    source_selector = {
        -- show_separator_on_edge = false,
        statusline = true,
    },
    highlight_background = "Normal"
})
