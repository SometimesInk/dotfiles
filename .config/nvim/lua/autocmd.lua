-- Set autoread and trigger on focus/buffer enter
vim.o.autoread = true
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
  pattern = "*",
  callback = function()
    if vim.fn.mode() ~= 'c' then
      vim.cmd('checktime')
    end
  end,
})

-- Turn .h files into C
vim.api.nvim_create_augroup("HFileAutoCmd", { clear = true })

vim.api.nvim_create_autocmd("BufRead", {
  group = "HFileAutoCmd",
  pattern = "*.h",
  callback = function()
    -- Run the specified command
    vim.cmd("set filetype=c")
  end,
})

vim.api.nvim_create_autocmd("BufNewFile", {
  group = "HFileAutoCmd",
  pattern = "*.h",
  callback = function()
    -- Run the specified command
    vim.cmd("set filetype=c")
  end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "mcmod.info",
  callback = function(args)
    vim.bo[args.buf].filetype = "json"
  end,
})

--[[
--vim.filetype.add({
--  pattern = {
--    ["Makefile"] = "make",
--    ["makefile"] = "make",
--    [".*%.env.*"] = "sh",
--  },
--  extension = {
--    make = "make",
--
--    vert = "glsl",
--    frag = "glsl",
--    geom = "glsl",
--    comp = "glsl",
--  },
--})
--]]

-- Enable java folding
vim.api.nvim_create_autocmd("FileType", {
  pattern = "java",
  callback = function()
    vim.opt_local.foldmarker = "<editor-fold>,</editor-fold>"
  end,
})
