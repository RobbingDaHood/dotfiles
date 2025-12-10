-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local Util = require("lazyvim.util")

vim.keymap.set("n", "<leader>ft", function()
  local width = math.floor(vim.o.columns * 0.2)
  -- Getting a deprication warning, but Snacks is not awailable yet
  Util.terminal(nil, { cwd = Util.root(), direction = "vertical", size = width })
  vim.cmd("wincmd H") -- Move the terminal split to the far left
  vim.cmd("vertical resize " .. width) -- Explicitly set the width
end, { desc = "Terminal (Root Dir, Left)" })

vim.keymap.set("n", "<leader>yn", function()
  require("config.codepointer_to_nearest_method").yank()
end, { desc = "Yank codepointer to nearest method" })

require("config.codepointer_go_to_path")
