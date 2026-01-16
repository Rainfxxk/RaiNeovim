-- 拦截第一次 require
require("options")
require("rpm")
require("keymaps")
require("lsp")
require("colors")

if vim.g.neovide then
    require("neovide")
end

require("comment")
vim.notify = require("notify")
