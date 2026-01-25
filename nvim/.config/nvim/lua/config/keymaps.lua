-- Keymapping
vim.api.nvim_set_keymap("n", "<C-Left>", ":bprevious<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-Right>", ":bnext<CR>", { noremap = true, silent = true })

-- Telescope bindings
local tscp = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", tscp.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", tscp.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", tscp.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fs", tscp.search_history, { desc = "Telescope search history" })
vim.keymap.set("n", "<leader>fc", tscp.command_history, { desc = "Telescope command history" })

-- Map arrow keys for wildmenu completion
-- It makes the command pallent more usable
vim.api.nvim_set_keymap('c', '<Down>', 'v:lua.get_wildmenu_key("<right>", "<down>")', { expr = true })
vim.api.nvim_set_keymap('c', '<Up>', 'v:lua.get_wildmenu_key("<left>", "<up>")', { expr = true })
-- vim.keymap.set('c', '<S-Tab>', '<C-y>', { noremap = true, silent = true })
function _G.get_wildmenu_key(key_wildmenu, key_regular)
  return vim.fn.wildmenumode() ~= 0 and key_wildmenu or key_regular
end
