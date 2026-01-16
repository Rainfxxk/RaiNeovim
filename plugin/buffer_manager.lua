require("buffer_manager").setup({
    width = 0.6,
    height = 0.6,
    win_extra_options = {
        relativenumber = true
    },
    use_shortcuts = true,
    -- path_unique = true,
    format_function = function(file)
        return vim.fn.fnamemodify(file, ':t') .. ' [' .. require("buffer_manager.utils").normalize_path(file) .. '] '
    end
})
