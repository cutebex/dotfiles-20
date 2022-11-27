local status_ok, Indent = pcall(require, "indent-o-matic")
if not status_ok then
	return
end

Indent.setup({
	max_lines = 2048,
	standard_widths = { 2, 4 },
	filetype_python = {
		standard_widths = { 4 },
	},
	filetype_rust = {
		standard_widths = { 4 },
	},
	filetype_javascriptreact = {
		standard_widths = { 2 },
	},
	filetype_typescriptreact = {
		standard_widths = { 2 },
	},
	filetype_javascript = {
		standard_widths = { 2 },
	},
	filetype_typescript = {
		standard_widths = { 2 },
	},
	filetype_ = {
		standard_widths = { 2 },
	},
})
