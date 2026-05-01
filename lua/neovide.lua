vim.o.guifont = "Hack Nerd Font Mono:h9"

vim.g.neovide_padding_top = 5
vim.g.neovide_padding_bottom = 5
vim.g.neovide_padding_right = 5
vim.g.neovide_padding_left = 5

vim.g.neovide_opacity = 0.8
vim.g.neovide_normal_opacity = 0.8

vim.g.neovide_floating_blur_amount_x = 0.5
vim.g.neovide_floating_blur_amount_y = 0.5
vim.g.neovide_floating_shadow = false
vim.g.neovide_floating_corner_radius = 0.5

vim.g.neovide_title_background_color = string.format(
    "%x",
    vim.api.nvim_get_hl(0, {id=vim.api.nvim_get_hl_id_by_name("Normal")}).bg
)

vim.g.neovide_title_text_color = string.format(
    "%x",
    vim.api.nvim_get_hl(0, {id=vim.api.nvim_get_hl_id_by_name("Normal")}).fg
)
