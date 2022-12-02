local lsp_ok, lspconfig = pcall(require, "lspconfig")
local cmp_ok, cmp_cap = pcall(require, "cmp_nvim_lsp")

if not lsp_ok then
	return
end
if not cmp_ok then
	return
end
-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	-- client.resolved_capabilities.document_formatting = true
	client.server_capabilities.documentFormattingProvider = true
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	-- vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, bufopts)
	-- vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
	-- vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
	vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, bufopts)
	vim.keymap.set("n", "<leader>pp", vim.lsp.buf.format(), bufopts)
end
-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp_cap.default_capabilities(capabilities)

local lsp_flags = {
	-- This is the default in Nvim 0.7+
	debounce_text_changes = 150,
}

local python_root_files = {
	"WORKSPACE", -- added for Bazel; items below are from default config
	"pyproject.toml",
	"setup.py",
	"setup.cfg",
	"requirements.txt",
	"Pipfile",
	"pyrightconfig.json",
}

lspconfig["pyright"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
	flags = lsp_flags,
	root_dir = lspconfig.util.root_pattern(unpack(python_root_files)),
})
lspconfig["solargraph"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
	flags = lsp_flags,
})


-- lspconfig["dartls"].setup({
-- 	capabilities = capabilities,
-- 	flags = lsp_flags,
-- 	closingLabels = true,
-- 	flutterOutline = true,
-- 	onlyAnalyzeProjectsWithOpenFiles = true,
-- 	outline = true,
-- 	suggestFromUnimportedLibraries = true,
-- })

lspconfig["tsserver"].setup({
	capabilities = capabilities,

	flags = lsp_flags,
	init_options = require("nvim-lsp-ts-utils").init_options,
	on_attach = function(client, bufnr)
		local ts_utils = require("nvim-lsp-ts-utils")

		-- defaults
		ts_utils.setup({
			debug = false,
			disable_commands = false,
			enable_import_on_completion = false,

			-- import all
			import_all_timeout = 5000, -- ms
			-- lower numbers = higher priority
			import_all_priorities = {
				same_file = 1, -- add to existing import statement
				local_files = 2, -- git files or files with relative path markers
				buffer_content = 3, -- loaded buffer content
				buffers = 4, -- loaded buffer names
			},
			import_all_scan_buffers = 100,
			import_all_select_source = false,
			-- if false will avoid organizing imports
			always_organize_imports = true,

			-- filter diagnostics
			filter_out_diagnostics_by_severity = {},
			filter_out_diagnostics_by_code = {},

			-- inlay hints
			auto_inlay_hints = false,

			-- update imports on file move
			update_imports_on_move = false,
			require_confirmation_on_move = false,
			watch_dir = nil,
		})

		-- required to fix code action ranges and filter diagnostics
		ts_utils.setup_client(client)

		-- no default maps, so you may want to define some here
		local opts = { silent = true }

		local bufopts = { noremap = true, silent = true, buffer = bufnr }

		vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
		vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, bufopts)
		vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, bufopts)
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
		-- vim.keymap.set("n", "<leader>pp", vim.lsp.buf.format(), bufopts)
		vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, bufopts)

		vim.api.nvim_buf_set_keymap(bufnr, "n", "tgs", ":TSLspOrganize<CR>", opts)
		vim.api.nvim_buf_set_keymap(bufnr, "n", "tgr", ":TSLspRenameFile<CR>", opts)
		vim.api.nvim_buf_set_keymap(bufnr, "n", "tgi", ":TSLspImportAll<CR>", opts)
	end,
})
lspconfig["tailwindcss"].setup({})
