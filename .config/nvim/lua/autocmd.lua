-- Custom filetypes
vim.filetype.add({
  extension = {
    inc = "c",
    c = "c",
    h = "c",
    cc = "cpp",
    hh = "cpp",
  },
  filename = {
    ["mcmod.info"] = "json",
  },
})

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
--vim.api.nvim_create_augroup("HFileAutoCmd", { clear = true })
--
--vim.api.nvim_create_autocmd("BufRead", {
--  group = "HFileAutoCmd",
--  pattern = "*.h",
--  callback = function()
--    -- Run the specified command
--    vim.cmd("set filetype=c")
--  end,
--})
--
--vim.api.nvim_create_autocmd("BufNewFile", {
--  group = "HFileAutoCmd",
--  pattern = "*.h",
--  callback = function()
--    -- Run the specified command
--    vim.cmd("set filetype=c")
--  end,
--})
