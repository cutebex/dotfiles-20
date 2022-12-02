---------------- General Settings ------------------

local opt = vim.opt
local g = vim.g

g.t_Co=256

g.mapleader = ","
g.user_emmet_leader_key = ","
g.better_escape_shortcut = "jj"
g.better_escape_interval = 200

-- opt.background = "dark"
-- opt.showmatch = true
-- opt.hlsearch = true
-- opt.incsearch = true
--
opt.ruler = false
opt.number = true
opt.numberwidth = 2
opt.relativenumber = true

opt.foldmethod = "indent"
opt.foldlevel = 99

opt.splitbelow = true
opt.splitright = true

opt.laststatus = 2
opt.showmode = false

opt.shortmess:append("sI")

opt.guifont = "Hack Nerd Font:h14"
--set.foldmethod = "expr"
--set.foldexpr = "nvim_treesitter#foldexpr()"

opt.encoding = "UTF-8"

opt.termguicolors = true

-- TextEdit might fail if hidden is not set.
opt.hidden = true
opt.backup = false
opt.writebackup = false
opt.cursorline = true

opt.spelllang = "en_us"
opt.list = true

-- Indenting
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.tabstop = 2
opt.softtabstop = 2

-- wrap lines visually
opt.wrap = false
opt.linebreak = true
opt.showbreak = "↳"
opt.list = true

-- set cmdheight=2
opt.updatetime = 1000
-- Don't pass messages to |ins-completion-menu|.

-- diagnostics appear/become resolved.
opt.signcolumn = "yes"
opt.swapfile = false
opt.scrolloff = 5
opt.clipboard = "unnamedplus"

opt.mouse = "a"

-- opt.cinoptions = { "g0", "l1", i0 }
-- opt.backspace = { "indent", "eol", "start" }

-- set.listchars = {tab = '▸', trail = '▫', nbsp = "_", extends = "»", precedes = "«",  }
-- set.listchars = {eol = ' ', tab = ' ', trail = ' '}

-- opt.whichwrap:append "<>[]hl"

vim.cmd([[
  syntax on
  syntax enable
  filetype off
  filetype plugin on
]])

-- disable some builtin vim plugins
local default_plugins = {
	"2html_plugin",
	"getscript",
	"getscriptPlugin",
	"gzip",
	"logipat",
	"netrw",
	"netrwPlugin",
	"netrwSettings",
	"netrwFileHandlers",
	"matchit",
	"tar",
	"tarPlugin",
	"rrhelper",
	"spellfile_plugin",
	"vimball",
	"vimballPlugin",
	"zip",
	"zipPlugin",
	"tutor",
	"rplugin",
	"syntax",
	"synmenu",
	"optwin",
	"compiler",
	"bugreport",
	"ftplugin",
}

for _, plugin in pairs(default_plugins) do
	g["loaded_" .. plugin] = 1
end

local default_providers = {
	"node",
	"perl",
	"python3",
	"ruby",
	"dart",
}

for _, provider in ipairs(default_providers) do
	g["loaded_" .. provider .. "_provider"] = 0
end
