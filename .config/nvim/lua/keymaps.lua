local opts = { noremap = true, silent = true }
-- Unbind arrow keys
vim.api.nvim_set_keymap("n", "<Up>", "", opts)
vim.api.nvim_set_keymap("n", "<Down>", "", opts)
vim.api.nvim_set_keymap("n", "<Left>", "", opts)
vim.api.nvim_set_keymap("n", "<Right>", "", opts)

vim.api.nvim_set_keymap("i", "<Up>", "", opts)
vim.api.nvim_set_keymap("i", "<Down>", "", opts)
vim.api.nvim_set_keymap("i", "<Left>", "", opts)
vim.api.nvim_set_keymap("i", "<Right>", "", opts)

vim.api.nvim_set_keymap("v", "<Up>", "", opts)
vim.api.nvim_set_keymap("v", "<Down>", "", opts)
vim.api.nvim_set_keymap("v", "<Left>", "", opts)
vim.api.nvim_set_keymap("v", "<Right>", "", opts)

vim.api.nvim_set_keymap("c", "<Up>", "", opts)
vim.api.nvim_set_keymap("c", "<Down>", "", opts)
vim.api.nvim_set_keymap("c", "<Left>", "", opts)
vim.api.nvim_set_keymap("c", "<Right>", "", opts)

-- Prevent deletes from overwriting clipboard
vim.keymap.set({ "n", "v" }, "d", '"_d')
vim.keymap.set({ "n", "v" }, "D", '"_D')
-- vim.keymap.set({ "n", "v" }, "x", '"_x')

-- Prevent changes from overwriting clipboard
vim.keymap.set({ "n", "v" }, "c", '"_c')
vim.keymap.set("n", "C", '"_C')

-- Prevent visual paste from overwriting clipboard
vim.keymap.set("x", "p", '"_dP')
