-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.clipboard = "unnamedplus"

-- Allow loading .nvim.lua from project root
vim.opt.exrc = true
vim.opt.secure = true

-- Prevent a bug where everything seems froozen because there is a:
-- Hidden command requiring input that never shows.
-- Just ignore those casea and check <leader>sna
-- The prompt will show shortly on the UI.
-- Usually happened when moving through stacktrace during debugging.
vim.opt.cmdheight = 1
vim.opt.more = false
