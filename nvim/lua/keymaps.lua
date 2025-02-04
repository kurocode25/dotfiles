local keymap = vim.api.nvim_set_keymap

-- window
keymap("n", "<C-h>", "<C-w>h", {desc = "window left"})
keymap("n", "<C-l>", "<C-w>l", {desc = "window right"})
keymap("n", "<C-j>", "<C-w>j", {desc = "window down"})
keymap("n", "<C-k>", "<C-w>k", {desc = "window up"})

-- buffer
keymap("n", "<C-Up>", "<cmd>bprev<cr>", {desc = "Prev Buffer"})
keymap("n", "<C-Down>", "<cmd>bnext<cr>", {desc = "Next Buffer"})
keymap("n", "<leader>w", "<cmd>bdelete<cr>", {desc = "delete Buffer"})

-- Neotree
keymap("n", "<C-t>", "<cmd>Neotree toggle<cr>", {desc = "Open Neotree"})
keymap("n", "<leader>", "<cmd>WhichKey<cr>", {desc = "Open WhichKey"})

-- skkeleton
keymap("c", "<C-j>", "<Plug>(skkeleton-enable)", {desc = "skkeleton on"})
keymap("i", "<C-j>", "<Plug>(skkeleton-enable)", {desc = "skkeleton on"})
