-- Main options
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.showmode = false
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- <Space> as leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Tab/indent settings
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.autoindent = true
vim.opt.cindent = true
vim.opt.smartindent = true
vim.opt.expandtab = true

vim.opt.cmdheight = 0

-- Custom tab setting for some file types
vim.cmd([[au FileType crontab,fstab,make set noexpandtab tabstop=8 shiftwidth=8]])

-- My ansible folders
-- vim.cmd([[au BufRead,BufNewFile */playbooks/*.yml set filetype=yaml.ansible]])
vim.cmd([[au BufRead,BufNewFile */inventories/* set filetype=ansible_hosts]])

-- vim.cmd([[set nohlsearch]])

vim.opt.spelllang = "en_us,ru"
