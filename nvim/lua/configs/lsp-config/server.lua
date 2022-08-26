local lsp_ok, lspconfig = pcall(require, "lspconfig")
local cmp_ok, cmp_cap = pcall(require, "cmp_nvim_lsp")
local aerial_ok, aerial = pcall(require, "aerial")
local status, mason = pcall(require, "mason")
if (not status) then return end
local status2, masonconfig = pcall(require, "mason-lspconfig")
if (not status2) then return end

mason.setup({

})

masonconfig.setup {
  ensure_installed = { "sumneko_lua", "tailwindcss" },
}


if not lsp_ok then
	return
end
if not cmp_ok then
	return
end
if not aerial_ok then
	return
end
-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
-- vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
-- vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	client.resolved_capabilities.document_formatting = false
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
	--vim.keymap.set("n", "<leader>pp", vim.lsp.buf.formatting_sync, bufopts)
end
-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp_cap.update_capabilities(capabilities)

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

lspconfig["tsserver"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
	flags = lsp_flags,
})
lspconfig["tailwindcss"].setup({})
lspconfig.vimls.setup({
	on_attach = aerial.on_attach,
})
