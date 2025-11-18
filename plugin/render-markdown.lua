vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*.md",
    once = true,
    callback = function()
        vim.print("第一次打开一个md文件")
        require("render-markdown").setup({
            enabled = true,
            render_modes = true,
            sign = {
                enabled = false,
            },
            completions = {
                blink = {
                    enabled = true,
                },
            },
        })
    end
})
