local status_ok, mason = pcall(require, "mason")
local status2, masonconfig = pcall(require, "mason-lspconfig")
if not status_ok then
	return
end
if not status2 then
	return
end

mason.setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

masonconfig.setup({
	ensure_installed = { "sumneko_lua", "tailwindcss" },
})
