local status_ok, harpoon  = pcall(require, "harpoon")
if not status_ok then
	return
end

harpoon:setup()

vim.keymap.set("n", "<leader>ha", function() harpoon:list():append() end)
vim.keymap.set("n", "<leader>he", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<leader>sj", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<leader>sk", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<leader>sl", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<leader>s;", function() harpoon:list():select(4) end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<leader>hp", function() harpoon:list():prev() end)
vim.keymap.set("n", "<leader>hn", function() harpoon:list():next() end)
