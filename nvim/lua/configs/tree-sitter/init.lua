local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

treesitter.setup({
	ensure_installed = {
		"python",
		"lua",
		"ruby",
		"typescript",
		"javascript",
		"dart"
	},
	--ignore_install = { "php", "phpdoc" },
	sync_install = false,
	auto_install = true,
	-- indent = {
	-- 	enabled = true,
	-- },
	highlight = {
		enable = true,
		use_languagetree = true,
		additional_vim_regex_highlighting = false,
	},
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
	incremental_selection = { enable = true },
	autopairs = { enable = true },
	autotag = {
		enable = true,
	},
	refactor = {
		highlight_definitions = {
			enable = true,
			-- Set to false if you have an `updatetime` of ~100.
			clear_on_cursor_move = true,
		},
		smart_rename = {
			enable = true,
			keymaps = {
				smart_rename = "grr",
			},
		},
		navigation = {
			enable = true,
			keymaps = {
				goto_definition = "gnd",
				list_definitions = "gnD",
				list_definitions_toc = "gO",
				goto_next_usage = "gnu",
				goto_previous_usage = "gnp",
			},
		},
	},
})
