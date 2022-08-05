local status_ok, restnvim = pcall(require, "rest-nvim")

if not status_ok then
	return
end

restnvim.setup({
	-- Open request results in a horizontal split
	result_split_horizontal = false,
	-- Keep the http file buffer above|left when split horizontal|vertical
	result_split_in_place = false,
	-- Skip SSL verification, useful for unknown certificates
	skip_ssl_verification = false,
	-- Highlight request on run
	highlight = {
		enabled = true,
		timeout = 150,
	},
	result = {
		-- toggle showing URL, HTTP info, headers at top the of result window
		show_url = true,
		show_http_info = false,
		show_headers = false,
	},
	-- Jump to request line on run
	jump_to_request = false,
	env_file = ".env",
	custom_dynamic_variables = {},
	yank_dry_run = true,
})

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map("n", "<leader>rt", "<Plug>RestNvim", opts) -- run under the cursor
map("n", "<leader>rp", "<Plug>RestNvimPreview", opts) -- preview curl command
map("n", "<leader>rr", "<Plug>RestNvimLast", opts) -- rerun last request
