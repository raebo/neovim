vim.g.mapleader = " " -- Space as leader

local map = vim.keymap.set
map("n", "<leader>w", ":w<CR>", { desc = "Save file" })
map("n", "<leader>q", ":q<CR>", { desc = "Quit" })
map("n", "<leader>ff", ":Telescope find_files<CR>", { desc = "Find files" })
map("n", "<leader>fg", ":Telescope live_grep<CR>", { desc = "Live grep" })

-- Command-T style mapping
map("n", "<leader>ff", function()
  require("telescope.builtin").find_files({
    hidden = true,
    follow = true,
  })
end, { desc = "Find files" })

map("n", "<leader>fg", function()
  require("telescope.builtin").live_grep({
    hidden = true,
  })
end, { desc = "Live grep" })

map("n", "<leader>ff", function()
  require("telescope.builtin").find_files({
    hidden = true,
    follow = true,
    prompt_title = "Command-T",
    layout_config = { width = 0.8, height = 0.6 },
  })
end, { desc = "Find files" })

map("n", "<leader>fg", function()
  require("telescope.builtin").live_grep({
    hidden = true,
  })
end, { desc = "Live grep" })

-- Tabs
--map("n", "<leader>tn", ":tabnew<CR>", { desc = "New tab" })
--map("n", "<leader>tc", ":tabclose<CR>", { desc = "Close tab" })
--map("n", "<leader>tl", ":tabnext<CR>", { desc = "Next tab" })
--map("n", "<leader>th", ":tabprevious<CR>", { desc = "Previous tab" })

map("n", "<leader>tn", ":tabnew<CR>", { desc = "New tab" })
map("n", "<leader>tc", ":tabclose<CR>", { desc = "Close tab" })
map("n", "<leader>tl", ":tabnext<CR>", { desc = "Next tab" })
map("n", "<leader>th", ":tabprevious<CR>", { desc = "Previous tab" })


-- File Explorer
map("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle File Explorer" })
map("n", "<leader>fe", ":NvimTreeFocus<CR>", { desc = "Focus File Explorer" })

-- Visual mode indent right/left
--map("v", "<leader>>", ">gv", { desc = "Indent selection right" })
--map("v", "<leader><", "<gv", { desc = "Indent selection left" })
map("v", "<Tab>", ">gv", { desc = "Indent right" })
map("v", "<S-Tab>", "<gv", { desc = "Indent left" })
