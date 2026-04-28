local keymap = vim.keymap

-- Leader
vim.g.mapleader = " "
local opt = { noremap = true, silent = true }

-- map :q
keymap.set({ 'n' }, "<leader>q", ":q<cr>", opt)

-- windows split and move
keymap.set({ 'n' }, "<c-v>",     "<c-w>v")
keymap.set({ 'n' }, "<c-s>",     "<c-w>s")
keymap.set({ 'n' }, "<c-h>",     "<c-w>h")
keymap.set({ 'n' }, "<c-j>",     "<c-w>j")
keymap.set({ 'n' }, "<c-k>",     "<c-w>k")
keymap.set({ 'n' }, "<c-l>",     "<c-w>l")
keymap.set({ 'n' }, "<leader>v", "<c-w>v")
keymap.set({ 'n' }, "<leader>s", "<c-w>s")
keymap.set({ 'n' }, "<leader>h", "<c-w>h")
keymap.set({ 'n' }, "<leader>j", "<c-w>j")
keymap.set({ 'n' }, "<leader>k", "<c-w>k")
keymap.set({ 'n' }, "<leader>l", "<c-w>l")

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
keymap.set({ 'n' }, "<s-h>", buf_prev, opt)
keymap.set({ 'n' }, "<s-l>", buf_next, opt)
-- keymap.set({ 'n' }, "<leader>bd", ":BufferLineCloseRight<cr>", opt)

-- Yazi
keymap.set({'n'}, "<leader>Y", ":Yazi<cr>", opt)
keymap.set({ 'n' }, "<leader>y", ":Oil --float --preview<cr>", opt)

-- buffer manager
keymap.set({ 'n' }, "<leader>bm", function () require("buffer_manager.ui").toggle_quick_menu() end, opt)
keymap.set({ 'n' }, "<leader>bl", function () require("bufferman.ui").bufferlist_toggle() end, opt)

-- Neotree
keymap.set({ 'n', 'v' }, "<leader>e", ":Neotree toggle<cr>", opt)


keymap.set({ 'n' }, '<leader>ff', require('telescope.builtin').find_files, { desc = 'Telescope find files' })
keymap.set({ 'n' }, '<leader>fg', require('telescope.builtin').live_grep,  { desc = 'Telescope live grep' })
keymap.set({ 'n' }, '<leader>fb', require('telescope.builtin').buffers,    { desc = 'Telescope buffers' })
keymap.set({ 'n' }, '<leader>fh', require('telescope.builtin').help_tags,  { desc = 'Telescope help tags' })
keymap.set({ 'n' }, '<leader>tt', ":FloatermToggle<cr>", opt)
keymap.set({ 'n' }, '<leader>tJ', ":FloatermNew --wintype=split --height=0.3 --position=rightbelow <cr>", opt)
keymap.set({ 'n' }, '<leader>tn', ":FloatermNew<cr>", opt)
keymap.set({ 'n' }, '<leader>th', ":FloatermHide!<cr>", opt)
keymap.set({ 'n' }, '<leader>tk', ":FloatermKill<cr>", opt)
keymap.set({ 'n' }, '<leader>ty', function()
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

keymap.set('n', '<leader>to', function()
    vim.g.floaterm_width = vim.g.floaterm_width - 0.1
    if vim.bo[vim.api.nvim_get_current_buf()].buftype == "terminal" then
        vim.cmd("FloatermUpdate --width=" .. vim.g.floaterm_width)
    end
end, opt)
keymap.set('n', '<leader>tu', function()
    vim.g.floaterm_height = vim.g.floaterm_height - 0.1
    if vim.bo[vim.api.nvim_get_current_buf()].buftype == "terminal" then
        vim.cmd("FloatermUpdate --height=" .. vim.g.floaterm_height)
    end
end, opt)
keymap.set('n', '<leader>ti', function()
    vim.g.floaterm_height = vim.g.floaterm_height + 0.1
    if vim.bo[vim.api.nvim_get_current_buf()].buftype == "terminal" then
        vim.cmd("FloatermUpdate --height=" .. vim.g.floaterm_height)
        vim.print("FloatermUpdate --height=" .. vim.g.floaterm_height)
    end
end, opt)
keymap.set('t', '<ESC><ESC>', "<C-\\><C-n>", opt)

-- lsp
keymap.set({ 'n' }, 'gf', vim.lsp.buf.format, opt)
keymap.set({ 'n' }, 'gd', vim.lsp.buf.definition, opt)
keymap.set({ 'n' }, 'gD', vim.lsp.buf.declaration, opt)
keymap.set({ 'n' }, 'gi', vim.diagnostic.open_float, opt)
keymap.set({ 'n' }, 'gj', function() vim.diagnostic.jump { count = 1 } end, opt)
keymap.set({ 'n' }, 'gk', function() vim.diagnostic.jump { count = -1 } end, opt)

-- multiple cursor
keymap.set({"n", "x"},   "<leader>cj",      "<Cmd>MultipleCursorsAddDown<CR>",          opt)
keymap.set({"n", "x"},   "<leader>ck",      "<Cmd>MultipleCursorsAddUp<CR>",            opt)
keymap.set({"n", "x"},   "<leader>c<Up>",   "<Cmd>MultipleCursorsAddUp<CR>",            opt)
keymap.set({"n", "x"},   "<leader>c<Down>", "<Cmd>MultipleCursorsAddDown<CR>",          opt)
keymap.set({"n" },      "<leader>cd",      "<Cmd>MultipleCursorsMouseAddDelete<CR>",   opt)
keymap.set({ "x" },      "<leader>cm",      "<Cmd>MultipleCursorsAddVisualArea<CR>",    opt)
keymap.set({ "n", "x" }, "<leader>ca",      "<Cmd>MultipleCursorsAddMatches<CR>",       opt)
keymap.set({ "n", "x" }, "<leader>cA",      "<Cmd>MultipleCursorsAddMatchesV<CR>",      opt)
keymap.set({ "n", "x" }, "<leader>c/",      "<Cmd>MultipleCursorsAddJumpNextMatch<CR>", opt)
keymap.set({ "n", "x" }, "<leader>cn",      "<Cmd>MultipleCursorsJumpNextMatch<CR>",    opt)
keymap.set({ "n", "x" }, "<leader>cl",      "<Cmd>MultipleCursorsLock<CR>",             opt)

