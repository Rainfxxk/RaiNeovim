-- 拦截第一次 require
local old_req = require
require = function(name)
    local result = string.find(name, "render-markdown") ~= nil
    if result then
        print(debug.traceback('render-markdown required at startup!'))
    end
    return old_req(name)
end
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
