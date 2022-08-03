local status_ok, tree = pcall(require, "nvim-tree")
if not status_ok then
	return
end

tree.setup({
	auto_reload_on_write = true,
	diagnostics = { enable = true },
	actions = {
		open_file = {
			resize_window = true,
		},
	},
	view = {
		width = 25,
		side = "left",
		hide_root_folder = true,
		mappings = {
			list = {
				{ key = "u", action = "dir_up" },
				{ key = "t", action = "tabnew" },
				{ key = "s", action = "vsplit" },
				{ key = "v", action = "split" },
				{ key = "o", action = "system_open" },
				{ key = "W", action = "collapse_all" },
				{ key = "S", action = "search_node" },
				{ key = "R", action = "refresh" },
				{ key = "ma", action = "create" },
				{ key = "md", action = "remove" },
				{ key = "mr", action = "rename" },
				{ key = "f", action = "live_filter" },
				{ key = "F", action = "clear_live_filter" },
			},
		},
	},
	log = {
		enable = true,
		truncate = true,
		types = {
			git = true,
			profile = true,
		},
	},
	filters = {
		dotfiles = true,
	},
})

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map("n", "<leader>v", ":NvimTreeFindFileToggle<CR>", opts)

local api = require("nvim-tree.api")
local Event = require("nvim-tree.api").events.Event

api.events.subscribe(Event.FileCreated, function(data)
	vim.cmd("tabnew" .. data.fname)
end)
