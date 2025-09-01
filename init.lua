require("config.plugins")
require("config.options")
require("config.keymaps")
require("config.colors")

if vim.g.neovide then
    require("config.neovide")
end

require("comment")
require("lualine").setup{}
vim.notify = require("notify")
require("neo-tree")
