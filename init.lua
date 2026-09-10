-- 拦截第一次 require
require("rpm")
require("keymaps")
require("lsp")
require("colors")
require("options")

vim.api.nvim_create_autocmd("UIEnter", {
    callback = function()
        if vim.g.neovide then
            require("neovide")
        end
    end
})
