local keymap = vim.keymap

-- Leader
vim.g.mapleader = " "
local opt = {noremap = true, silent = true}

-- map :q
keymap.set({'n'}, "<leader>q", ":q<cr>", opt)

-- windows split and move
keymap.set({'n'}, "<leader>v", "<c-w>v")
keymap.set({'n'}, "<leader>s", "<c-w>s")
keymap.set({'n'}, "<leader>h", "<c-w>h")
keymap.set({'n'}, "<leader>j", "<c-w>j")
keymap.set({'n'}, "<leader>k", "<c-w>k")
keymap.set({'n'}, "<leader>l", "<c-w>l")

-- buffer move, support floaterm
local function buf_prev()
    if vim.bo[vim.api.nvim_get_current_buf()].buftype == "terminal" then
        vim.cmd("call floaterm#prev()")
        -- vim.fn[floaterm#prev]()
    else
        require("bufferline").cycle(-1)
    end
end

local function buf_next()
    if vim.bo[vim.api.nvim_get_current_buf()].buftype == "terminal" then
        vim.cmd("call floaterm#next()")
    else
        require("bufferline").cycle(1)
    end
end

-- keymap.set({'n'}, "<s-h>", ":BufferLineCyclePrev<cr>", opt)
-- keymap.set({'n'}, "<s-l>", ":BufferLineCycleNext<cr>", opt)
keymap.set({'n'}, "<s-h>", buf_prev, opt)
keymap.set({'n'}, "<s-l>", buf_next, opt)
keymap.set({'n'}, "<leader>bd", ":BufferLineCloseRight<cr>", opt)

-- Yazi
keymap.set({'n'}, "<leader>y", ":Yazi<cr>", opt)

-- Neotree
keymap.set({'n', 'v'}, "<leader>e", ":Neotree toggle<cr>", opt)

local builtin = require('telescope.builtin')
keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

keymap.set('n', '<leader>tt', ":FloatermToggle<cr>", opt)
keymap.set('n', '<leader>tJ', ":FloatermNew --wintype=split --height=0.3 --position=rightbelow <cr>", opt)
keymap.set('n', '<leader>tn', ":FloatermNew<cr>", opt)
keymap.set('n', '<leader>th', ":FloatermHide!<cr>", opt)
keymap.set('n', '<leader>tk', ":FloatermKill<cr>", opt)
keymap.set('n', '<leader>ty', function ()
    vim.g.floaterm_width = vim.g.floaterm_width + 0.1
    if (vim.g.floaterm_width >= 0.9) then
        vim.g.floterm_width = vim.o.columns
        vim.print(vim.o.columns)
    end
    if vim.bo[vim.api.nvim_get_current_buf()].buftype == "terminal" then
        vim.cmd("FloatermUpdate --width=" .. vim.g.floaterm_width)
        vim.print("FloatermUpdate --floaterm_width=" .. vim.g.floaterm_width)
    end
end, opt)
keymap.set('n', '<leader>to', function ()
    vim.g.floaterm_width = vim.g.floaterm_width - 0.1
    if vim.bo[vim.api.nvim_get_current_buf()].buftype == "terminal" then
        vim.cmd("FloatermUpdate --width=" .. vim.g.floaterm_width)
    end
end, opt)
keymap.set('n', '<leader>tu', function ()
    vim.g.floaterm_height = vim.g.floaterm_height - 0.1
    if vim.bo[vim.api.nvim_get_current_buf()].buftype == "terminal" then
        vim.cmd("FloatermUpdate --height=" .. vim.g.floaterm_height)
    end
end, opt)
keymap.set('n', '<leader>ti', function ()
    vim.g.floaterm_height = vim.g.floaterm_height + 0.1
    if vim.bo[vim.api.nvim_get_current_buf()].buftype == "terminal" then
        vim.cmd("FloatermUpdate --height=" .. vim.g.floaterm_height)
        vim.print("FloatermUpdate --height=" .. vim.g.floaterm_height)
    end
end, opt)
keymap.set('t', '<ESC>', "<C-\\><C-n>", opt)

-- lsp
keymap.set('n', 'gd', vim.lsp.buf.definition, opt)
keymap.set('n', 'gD', vim.lsp.buf.declaration, opt)
keymap.set('n', 'gi', vim.diagnostic.open_float, opt)

keymap.set({'n', 'v'}, '<leader>/', ":AutoComment<cr>", opt)

