require("config.options")
require("config.plugins")
require("config.keymaps")
require("config.colors")

if vim.g.neovide then
    require("config.neovide")
end

-- require("comment")
-- require("lualine").setup{}
-- vim.notify = require("notify")
-- require("neo-tree")

-- local a = 0
-- 
-- vim.api.nvim_create_autocmd("BufEnter", {
--     desc = "Reset local oil window options when buffer changes",
--     pattern = "*",
--     callback = function(params)
--         vim.print("bufwinenter" .. a)
--         a = a + 1
--     end,
-- })
