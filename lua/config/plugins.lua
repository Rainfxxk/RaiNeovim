local plugins = {
    {
        name = "comment.nvim",
        author = "Rainfxxk",
    },
    {
        name = "github-nvim-theme",
        author = "projekt0n",
    },
    {
        name = "nvim-quietlight",
        author = "HUAHUAI23",
    },
    {
        name = "plenary.nvim",
        author = "nvim-lua",
    },
    -- {
    --     name = "yazi",
    --     author = "mikavilpas",
    -- },
    {
        name = "oil.nvim",
        author = "stevearc",
    },
    {
        name = "lualine.nvim",
        author = "nvim-lualine",
    },
    {
        name = "nvim-web-devicons",
        author = "nvim-tree",
    },
    {
        name = "nvim-notify",
        author = "rcarriga",
    },
    {
        name = "nui.nvim",
        author = "MunifTanjim",
    },
    {
        name = "noice.nvim",
        author = "folke",
    },
    {
        name = "neo-tree.nvim",
        author = "nvim-neo-tree",
    },
    {
        name = "bufferline.nvim",
        author = "akinsho",
    },
    {
        name = "telescope.nvim",
        author = "nvim-telescope",
    },
    {
        name = "nvim-treesitter",
        author = "nvim-treesitter",
    },
    {
        name = "dashboard-nvim",
        author = "nvimdev",
    },
    {
        name = "nvim-lspconfig",
        author = "neovim",
    },
    {
        name = "mason.nvim",
        author = "mason-org",
    },
    {
        name = "mason-lspconfig.nvim",
        author = "mason-org",
    },
    {
        name = "blink.cmp",
        author = "Saghen",
    },
    {
        name = "nvim-dap",
        author = "mfussenegger",
    },
    {
        name = "nvim-dap-ui",
        author = "rcarriga",
    },
    {
        name = "vim-floaterm",
        author = "voldikss",
    },
    {
        name = "nvim-window-picker",
        author = "s1n7ax",
    },
    {
        name = "friendly-snippets",
        author = "rafamadriz",
    },
    {
        name = "indent-blankline.nvim",
        author = "lukas-reineke",
    },
    {
        name = "remote-nvim.nvim",
        author = "amitds1997",
    },
    -- {
    --     name = "smear-cursor.nvim",
    --     author = "sphamba" 
    -- },
    {
        name = "neovim",
        author = "rose-pine",
    },
    {
        name = "vscode.nvim",
        author = "gamunu",
    },
    {
        name = "render-markdown.nvim",
        author = "MeanderingProgrammer",
    },
}

local prefix = vim.fn.stdpath("data")

local platform = vim.loop.os_uname().sysname

function is_path_exist(path, platform)
    local result
    if platform == "Linux" then
        result = os.execute('if [ -d "' .. path .. '" ]; then exit 1; else exit 0; fi')
        if (result == 0) then
            result = false
        else
            result = true
        end
    elseif platform == "Darwin" then
        vim.print("not support MacOs")
    elseif platform == "Windows_NT" then
        result = os.execute( 'if exist "' .. path .. '" (exit 1) else (exit 0)' )
        -- vim.print("windows: " .. path .. result)
    else
        vim.print("未知平台:", platform)
    end

    return result
end

for _, plugin in ipairs(plugins) do
    local path = vim.fs.joinpath(prefix, plugin.name)

    if (is_path_exist(path, platform) == 0) then
        retult = vim.fn.system("git clone https://github.com/" .. plugin.author .. "/" .. plugin.name .. " " .. path)
    end

    vim.opt.rtp:prepend(path)
end
