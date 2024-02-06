local status_ok, lualine = pcall(require, "neogit")
if not status_ok then
  return
end

lualine.setup {}
