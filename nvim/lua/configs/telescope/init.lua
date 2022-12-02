local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end
local actions = require("telescope.actions")

local transform_mod = require("telescope.actions.mt").transform_mod
local nvb_actions = transform_mod({
	file_path = function(prompt_bufnr)
		-- Get selected entry and the file full path
		local content = require("telescope.actions.state").get_selected_entry()
		local full_path = content.cwd .. require("plenary.path").path.sep .. content.value

		-- Yank the path to unnamed and clipboard registers
		vim.fn.setreg('"', full_path)
		vim.fn.setreg("+", full_path)

		-- Close the popup
		require("telescope.actions").close(prompt_bufnr)
	end,
})

telescope.setup({
	defaults = {
		selection_caret = " ",
		path_display = { "smart" },
		mappings = {
			i = {
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
				["<C-n>"] = actions.cycle_history_next,
				["<C-p>"] = actions.cycle_history_prev,
			},
		},
		history = {
			path = vim.fn.stdpath("data") .. "/telescope_history.sqlite3",
			limit = 100,
		},
	},
	pickers = {
		colorscheme = {
			enable_preview = true,
		},
		live_grep = {
			theme = "ivy",
			hidden = false,
			mappings = {
				i = {
					["<C-y>"] = nvb_actions.file_path,
				},
			},
		},
		grep_string = {
			theme = "ivy",
			hidden = false,
			mappings = {
				i = {
					["<C-y>"] = nvb_actions.file_path,
				},
			},
		},
		find_files = {
			theme = "ivy",
			mappings = {
				i = {
					["<C-y>"] = nvb_actions.file_path,
				},
			},
			hidden = false,
		},
	},
})

require("telescope").load_extension("flutter") -- Flutter
require("telescope").load_extension("neoclip") -- Neoclip
