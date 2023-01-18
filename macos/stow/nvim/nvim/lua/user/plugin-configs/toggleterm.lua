local status_ok, toggleterm  = pcall(require, "toggleterm")
if not status_ok then
  return
end

toggleterm.setup {
    open_mapping = [[<C-\>]],
    direction = "float",
    shell = "/opt/homebrew/bin/zsh",
}

