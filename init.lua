require "core"

vim.opt.swapfile = false

-- Настройка расширенного буфера обмена
vim.opt.clipboard:append("unnamedplus")

-- Настройка колонки цвета
vim.opt.colorcolumn = "79"


-- hotkeys
vim.api.nvim_set_keymap('n', ',<space>', ':nohlsearch<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-s>', ':w<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'S', '<Nop>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-z>', 'ZZ', { noremap = true })
vim.api.nvim_set_keymap('n', 'y', '$y', { noremap = true })

vim.api.nvim_set_keymap('i', '<c-s>', '<esc>:w<cr>i', { noremap = true })
vim.api.nvim_set_keymap('i', '<c-u>', '<esc>:u<cr>i', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-z>', '<Esc>', { noremap = true })

local custom_init_path = vim.api.nvim_get_runtime_file("lua/custom/init.lua", false)[1]

if custom_init_path then
  dofile(custom_init_path)
end

require("core.utils").load_mappings()

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

-- bootstrap lazy.nvim!
if not vim.loop.fs_stat(lazypath) then
  require("core.bootstrap").gen_chadrc_template()
  require("core.bootstrap").lazy(lazypath)
end

dofile(vim.g.base46_cache .. "defaults")
vim.opt.rtp:prepend(lazypath)
require "plugins"
