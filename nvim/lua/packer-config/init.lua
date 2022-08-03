return require("packer").startup(function()
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-- Optimize startup time
	use("lewis6991/impatient.nvim")

	-- Themings/icons/beautify/Customizing
	use("EdenEast/nightfox.nvim") -- theme
	use({ "catppuccin/nvim", as = "catppuccin" })
	use("kyazdani42/nvim-web-devicons") -- optional, for file icon
	use("nvim-lualine/lualine.nvim") --lualine/statusbar
	use("norcalli/nvim-colorizer.lua") -- show colors on live based on color codes
	use({
		"kyazdani42/nvim-tree.lua",
		requires = {
			"kyazdani42/nvim-web-devicons", -- optional, for file icons
		},
	})
	-- use({
	-- 	"nvim-neo-tree/neo-tree.nvim",
	-- 	branch = "v2.x",
	-- 	requires = {
	-- 		"nvim-lua/plenary.nvim",
	-- 		"kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
	-- 		"MunifTanjim/nui.nvim",
	-- 	},
	-- })

	-- Treesitter/Diagnostics/required by treessiter plugins
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }) --treesitter
	use("nvim-treesitter/nvim-treesitter-refactor") --extra features on top of treesitter eg: smart rename
	use("windwp/nvim-ts-autotag") -- autotag completion eg: <html></html>
	use("windwp/nvim-autopairs") -- autopair plugin eg: ()
	use("Darazaki/indent-o-matic") --intelligent indent detection based on filetype
	use("lukas-reineke/indent-blankline.nvim") -- block lines
	use("numToStr/Comment.nvim") -- comment integration

	-- Utils
	use("ggandor/lightspeed.nvim") -- search tool
	use("lewis6991/gitsigns.nvim") -- git signs on signcolumn
	use("seblj/nvim-tabline") -- enable tabs
	use({ "akinsho/toggleterm.nvim", tag = "v1.*" }) -- toggle term
	use({ "nvim-telescope/telescope.nvim", requires = { { "nvim-lua/plenary.nvim" } } }) --project wise search
	use("ur4ltz/surround.nvim") -- surrounding , parenthesis, brackets, quotes etc
	use("stevearc/aerial.nvim") -- code outline plugin, handy in large files
	use("mattn/emmet-vim") --emmet html and css
	use("tpope/vim-fugitive") --git integration
	use("folke/zen-mode.nvim") -- Zenmode
	use("folke/twilight.nvim") -- dims inactive portions of code

	-- LSP
	use("williamboman/nvim-lsp-installer")
	use("neovim/nvim-lspconfig") -- Configurations for Nvim LSP
	use({
		"glepnir/lspsaga.nvim",
		branch = "main",
	})
	use("jose-elias-alvarez/null-ls.nvim") --plugin for formatting

	-- Autocompletion
	use("hrsh7th/nvim-cmp") -- Autocompletion plugin
	use("hrsh7th/cmp-buffer") --cmp buffer source
	use("hrsh7th/cmp-nvim-lsp") -- LSP source for nvim-cmp
	use("saadparwaiz1/cmp_luasnip") -- Snippets source for nvim-cmp
	use("L3MON4D3/LuaSnip") -- Snippets plugin
	use("onsails/lspkind.nvim") -- icons on completion like vscode
	use({ "tzachar/cmp-tabnine", run = "./install.sh", requires = "hrsh7th/nvim-cmp" }) -- Tabnine
end)
