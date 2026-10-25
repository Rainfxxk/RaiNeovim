vim.api.nvim_create_autocmd("ColorScheme", {
    callback = function()
        vim.api.nvim_set_hl(0, "StatusLine", { link = "Normal" })
        vim.api.nvim_set_hl(0, "StatusLineNC", { link = "Normal" })
    end
})

-- vim.cmd("colorscheme github_dark_dimmed")
vim.cmd("colorscheme catppuccin-frappe")
-- vim.cmd("colorscheme tokyonight-storm")
-- vim.opt.background = 'light'
-- vim.cmd('colorscheme quietlight')
-- add this for disable colorcolumn
-- vim.cmd("highlight clear ColorColumn")
-- vim.cmd("colorscheme gruvbox")
