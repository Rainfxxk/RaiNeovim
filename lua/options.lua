local opt = vim.opt

-- clipboard
opt.clipboard:append("unnamedplus")

-- line number
opt.number = true
opt.relativenumber = true

-- tab
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

-- wrap
opt.wrap = true

-- ui
opt.cursorline = true
opt.termguicolors = true
opt.signcolumn = "yes"

-- windows split
opt.splitright = true
opt.splitbelow = true

-- search
opt.ignorecase = true
opt.smartcase = true

-- enable mouse 
opt.mouse:append("a")

opt.fillchars:append({
  vert = "│",
  horiz = "─",
  horizup = "┴",
  horizdown = "┬",
  vertleft = "┤",
  vertright = "├",
  verthoriz = "┼",
  eob = " ", -- 隐藏文末波浪~
})

opt.laststatus = 3;
vim.api.nvim_set_hl(0, "StatusLine", { link = "Normal" })
vim.api.nvim_set_hl(0, "StatusLineNC", { link = "Normal" })
