vim.opt.wrap = false 

vim.opt.termguicolors = true

vim.o.clipboard = 'unnamedplus'

-- 2 space tabs
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Line numbers
vim.opt.nu = true
vim.wo.number = true
vim.opt.relativenumber = true

vim.opt.cursorline = true

-- Decrease update time
vim.o.updatetime = 50
vim.o.timeoutlen = 300

-- Save undo history
vim.opt.swapfile = false
vim.opt.backup = false
vim.o.undofile = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Keep cursor fat
vim.opt.guicursor = ""

vim.diagnostic.config({ virtual_text = true })
