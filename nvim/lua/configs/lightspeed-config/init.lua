local status_ok, Speed = pcall(require, "lightspeed")
if not status_ok then
	return
end
Speed.setup({})
