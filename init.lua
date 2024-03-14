local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({"git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath})
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ' '

require("lazy").setup({
	{ import = "plugins" }
})

require("mason").setup()
require("mason-lspconfig").setup()

require("nvim-treesitter.configs").setup({
	ensure_installed = { "c", "lua", "zig" },
	sync_install = false,
	highlight = {
		enable = true
	},
})

require('nvim-web-devicons').setup({})

-- require('terminal')
require('lsp')

-- Neovim config
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.colorcolumn = "80"
vim.opt.list = true
vim.opt.listchars = 'tab:▸ ,trail:·'
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

vim.opt.splitbelow = true
vim.opt.splitright = true

-- Buffer navigation
vim.keymap.set('n', '<leader>h', '<C-w>h')
vim.keymap.set('n', '<leader>j', '<C-w>j')
vim.keymap.set('n', '<leader>k', '<C-w>k')
vim.keymap.set('n', '<leader>l', '<C-w>l')

vim.keymap.set('n', '<leader>vs', ':vsplit<CR>')
vim.keymap.set('n', '<leader>hs', ':split<CR>')
vim.keymap.set('n', '<leader>ts', ':split | | terminal<CR>')

vim.keymap.set('t', '<Esc>', '<C-\\><C-N>', { silent = true })

-- Telescope
local telescope = require("telescope.builtin")
vim.keymap.set('n', '<leader>ff', telescope.find_files, {})
vim.keymap.set('n', '<leader>fg', telescope.live_grep, {})

-- 42 Header
vim.g.user42 = 'ledelbec'
vim.g.mail42 = 'ledelbec@student.42.fr'

-- Colors
require('catppuccin').setup({
	no_italic = true,
	no_underline = true
})
vim.cmd.colorscheme('catppuccin')

