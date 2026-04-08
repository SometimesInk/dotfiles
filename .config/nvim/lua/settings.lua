vim.opt.wrap = true

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

vim.opt.foldcolumn = '4'
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true

vim.opt.fillchars = {
  foldopen = "",
  foldclose = "",
}

vim.diagnostic.config({ virtual_text = true })

vim.fn.sign_define("DapBreakpoint", { text = "点" })

--vim.api.nvim_set_hl(0, 'DapBreakpoint', { fg = "#c53b53", bg = '#222436' })
--vim.api.nvim_set_hl(0, 'DapStopped', { fg = "#636da6", bg = '#222436' })
