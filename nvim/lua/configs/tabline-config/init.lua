local status_ok, tabline = pcall(require, "tabline")
if not status_ok then
	return
end
tabline.setup({
	no_name = "[No Name]", -- Name for buffers with no name
	modified_icon = "●",
	close_icon = "", -- Icon for closing tab with mouse
	separator = "▎",
	padding = 3, -- Prefix and suffix space
	color_all_icons = false, -- Color devicons in active and inactive tabs
	right_separator = false, -- Show right separator on the last tab
	show_index = false, -- Shows the index of tab before filename
	show_icon = true, -- Shows the devicon
	-- If lualine is installed tabline will use separators configured in lualine by default.
	-- These options can be used to override those settings.
})
