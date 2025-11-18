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
    {
        name = "yazi.nvim",
        author = "mikavilpas",
    },
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
    -- {
    --     name = "nvim-lspconfig",
    --     author = "neovim",
    -- },
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

function create_float_window()
    local buf = vim.api.nvim_create_buf(false, true)
    local screen_h = vim.o.lines
    local screen_w = vim.o.columns
    local w = math.floor(screen_w * 0.6)
    local h = math.floor(screen_h * 0.6)
    local x = math.floor((screen_w - w) / 2)
    local y = math.floor((screen_h - h) / 2)
    local opts = {
        relative = 'win',
        width = w,
        height = h,
		col = x,
		row = y,
		anchor = 'NW',
		style = 'minimal',
        border = { "╭", "─" ,"╮", "│", "╯", "─", "╰", "│" },
        zindex = 50
    }
    local win = vim.api.nvim_open_win(buf, true, opts)
    vim.api.nvim_set_option_value('winhl', 'Normal:MyHighlight', {win = win})
    vim.keymap.set("n", "q", function()
        vim.api.nvim_win_close(win, true)
    end, {buffer = buf})

    local start_col = math.floor((w - string.len("Rain's Plugin Manager")) / 2)
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, { string.rep(" ", start_col) .. "Rain's Plugin Manager" })
    local ns = vim.api.nvim_create_namespace("manual_highlight")
    vim.hl.range(buf, ns, "Title", {0, start_col}, {0, start_col + string.len("Rain's Plugin Manager")}, nil)

    return buf, win
end

vim.api.nvim_create_user_command(
    "CreateFloatWin",
    create_float_window,
    {}
)

local buf = nil
local win = nil 
local line_num = 0


function download(plugin, win, buf, line_num)
    
    local title_line = line_num
    local progress_line = line_num + 1
    vim.api.nvim_buf_set_lines(buf, title_line, title_line + 1, false, { "downloading " .. plugin.name })

    local stdin = vim.uv.new_pipe()
    local stdout = vim.uv.new_pipe()
    local stderr = vim.uv.new_pipe()

    local target = vim.fs.joinpath(vim.fn.stdpath("data"), plugin.name)

    local handle, pid = vim.uv.spawn("git", {
            args = {
                "clone",
                "--progress",
                "--verbose",
                "https://github.com/" .. plugin.author .. "/" .. plugin.name,
                target,
            },
            stdio = {stdin, stdout, stderr}
        },
        function(code, signal) -- on exit
            vim.schedule(function ()
                vim.api.nvim_buf_set_lines(buf, title_line, title_line + 1, false, { plugin.name .. ": ✅" })
                -- vim.api.nvim_win_set_cursor(win, { vim.api.nvim_buf_line_count(buf), 0 })
            end)
        end
    )

    vim.uv.read_start(stderr, function(err, data)
        assert(not err, err)
        if data then
            vim.schedule(function ()
                for line in data:gmatch("[^\r\n]+") do
                    vim.api.nvim_buf_set_lines(buf, progress_line, progress_line + 1, false, { line })
                    -- vim.api.nvim_win_set_cursor(win, { vim.api.nvim_buf_line_count(buf), 0 })
                end
            end)
        else
            print("stderr end", stderr)
        end
    end)

end

for _, plugin in ipairs(plugins) do
    local path = vim.fs.joinpath(vim.fn.stdpath("data"), plugin.name)

    if (not vim.uv.fs_stat(path)) then
        if (buf == nil and win == nil) then
            buf, win = create_float_window()
            line_num = 0
        end
        download(plugin, win, buf, line_num)
        line_num = line_num + 2
	end

    vim.opt.rtp:prepend(path)
end
