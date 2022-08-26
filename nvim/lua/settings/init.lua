---------------- General Settings ------------------

local set = vim.opt

vim.g.mapleader = ","
set.background = "dark"
set.showmatch = true
set.hlsearch = true
set.incsearch = true
set.number = true
set.relativenumber = true
set.splitbelow = true
set.splitright = true
set.ruler = false
set.laststatus = 2
set.foldmethod = "indent"
set.guifont = "Hack Nerd Font:h14"
--set.foldmethod = "expr"
--set.foldexpr = "nvim_treesitter#foldexpr()"

set.foldlevel = 99
set.encoding = "UTF-8"

-- TextEdit might fail if hidden is not set.
set.hidden = true
set.backup = false
set.writebackup = false
set.cursorline = true
set.spelllang = "en_us"
set.list = true
set.termguicolors = true

-- wrap lines visually
set.wrap = false
set.linebreak = true
set.showbreak = "↳"

-- set cmdheight=2
set.updatetime = 1000
-- Don't pass messages to |ins-completion-menu|.

-- diagnostics appear/become resolved.
set.signcolumn = "yes"
set.swapfile = false
set.scrolloff = 5
set.clipboard = "unnamedplus"

set.mouse = "a"

set.cinoptions = { "g0", "l1", i0 }
set.backspace = { "indent", "eol", "start" }

-- set.listchars = {tab = '▸', trail = '▫', nbsp = "_", extends = "»", precedes = "«",  }
-- set.listchars = {eol = ' ', tab = ' ', trail = ' '}
set.shortmess = set.shortmess + "c"

vim.cmd([[
  syntax on
  syntax enable
  filetype off
  filetype plugin on
]])
vim.g.user_emmet_leader_key = ","
vim.g.better_escape_shortcut='jj'
vim.g.better_escape_interval = 200

function _G.set_terminal_keymaps()
	local opts = { noremap = true }
	vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "jk", [[<C-\><C-n>]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
end

vim.cmd([[
  autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()
]])
vim.cmd([[
  autocmd! FileType * set formatoptions-=cro
]])
