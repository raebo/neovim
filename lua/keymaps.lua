local opts = { noremap = true, silent = true }
local api = require("nvim-tree.api")
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
    hidden = false,
  })
end, { desc = "Live grep" })

map("n", "<leader>fb", function()
  require("telescope.builtin").buffers({
    sort_mru = true,
    ignore_current_buffer = true,
    prompt_title = "Buffers",
  })
end, { desc = "List open buffers" })


-- Tabs
--map("n", "<leader>tc", "<cmd>tabclose<CR>", { desc = "Close tab" })
--map("n", "<leader>tl", "<cmd>tabnext<CR>", { desc = "Next tab" })
--map("n", "<leader>th", "<cmd>tabprevious<CR>", { desc = "Previous tab" })

-- Buffer navigation (what you probably need)
map("n", "<tab>", "<cmd>b#<CR>", { desc = "Switch to last buffer" })
map("n", "<leader>bn", "<cmd>bnext<CR>", { desc = "Next buffer" })
map("n", "<leader>bp", "<cmd>bprevious<CR>", { desc = "Previous buffer" })
map("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Delete buffer" })
map("n", "<leader>bl", "<cmd>buffers<CR>", { desc = "List buffers" })

-- File Explorer
local function ToggleNvimTreeFocus()
  --local api = require("nvim-tree.api")
  local view = require("nvim-tree.view")
  local buf_name = vim.api.nvim_buf_get_name(0)

  if view.is_visible() then
    if buf_name:match("NvimTree_") then
      -- We're in NvimTree, go back to last file window
      vim.cmd("wincmd p")
    else
      -- Focus the tree without closing it
      api.tree.focus()
    end
  else
    -- Tree is closed, open it
    vim.cmd("NvimTreeOpen")
  end
end

map('n', '<leader>e', ToggleNvimTreeFocus, { desc = "Focus/Toggle NvimTree", silent = true })
map('n', '<leader>n', ':NvimTreeToggle<CR>', { silent = true })
map('n', '<leader>e', ':NvimTreeFindFileToggle<CR>', { silent = true }) -- this will opent the tree a the position of the current file
--map("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle File Explorer" })
map("n", "<leader>fe", ":NvimTreeFocus<CR>", { desc = "Focus File Explorer" })


-- Visual mode indent right/left
--map("v", "<leader>>", ">gv", { desc = "Indent selection right" })
--map("v", "<leader><", "<gv", { desc = "Indent selection left" })
map("v", "<Tab>", ">gv", { desc = "Indent right" })
map("v", "<S-Tab>", "<gv", { desc = "Indent left" })


-- Split windows
map('n', '<leader>sv', ':vsplit<CR>', opts) -- vertical split
map('n', '<leader>sh', ':split<CR>', opts)  -- horizontal split
map('n', '<leader>sc', ':close<CR>', opts)  -- close current split
map('n', '<leader>so', ':only<CR>', opts)   -- keep only current split

-- Move between windows (easier than <C-w>h etc.)
map('n', '<C-h>', '<C-w>h', opts) -- control + h
map('n', '<C-j>', '<C-w>j', opts) -- control + j
map('n', '<C-k>', '<C-w>k', opts) -- control + k
map('n', '<C-l>', '<C-w>l', opts) -- control + l

-- Resize windows
map('n', '<C-Up>', ':resize -2<CR>', opts)
map('n', '<C-Down>', ':resize +2<CR>', opts)
map('n', '<C-Left>', ':vertical resize -2<CR>', opts)
map('n', '<C-Right>', ':vertical resize +2<CR>', opts)

-- Equalize window sizes
map('n', '<leader>=', '<C-w>=', opts)


-- Terminal settings
-- Open terminal in horizontal split
vim.keymap.set('n', '<leader>1', ':split | terminal<CR>', { noremap = true, silent = true })

-- Open terminal in vertical split
vim.keymap.set('n', '<leader>2', ':vsplit | terminal<CR>', { noremap = true, silent = true })

-- Exit terminal mode quickly
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], { noremap = true })


---- git keybindings
-- For fugitive
vim.keymap.set("n", "<leader>gs", ":Git<CR>", { desc = "Git status" })
vim.keymap.set("n", "<leader>gb", ":Git blame<CR>", { desc = "Git blame" })

-- For gitsigns
vim.keymap.set("n", "]g", require("gitsigns").next_hunk, { desc = "Next git hunk" })
vim.keymap.set("n", "[g", require("gitsigns").prev_hunk, { desc = "Prev git hunk" })
vim.keymap.set("n", "<leader>gp", require("gitsigns").preview_hunk, { desc = "Preview git hunk" })

-- Open Diffview (compare working tree to HEAD)
vim.keymap.set("n", "<leader>do", ":DiffviewOpen<CR>", { desc = "Open Diffview" })

-- Close Diffview
vim.keymap.set("n", "<leader>dc", ":DiffviewClose<CR>", { desc = "Close Diffview" })

-- Open Diffview for current file
vim.keymap.set("n", "<leader>df", ":DiffviewFileHistory %<CR>", { desc = "File history for current file" })

-- Open Diffview for entire repo history
vim.keymap.set("n", "<leader>dh", ":DiffviewFileHistory<CR>", { desc = "Repository file history" })

-- Toggle the file panel (when Diffview is open)
vim.keymap.set("n", "<leader>dt", ":DiffviewToggleFiles<CR>", { desc = "Toggle Diffview file panel" })


--- Nviem-tree keybindings
--- Default keybindings are usually fine, but here are some examples:
-- Open file or folder
---vim.keymap.set("n", "<leader>o", api.node.open.edit, { desc = "Open file/folder" })
-- Create new file or folder
-- vim.keymap.set("n", "a", api.fs.create, { desc = "Create file/folder" })
-- Delete file or folder
-- vim.keymap.set("n", "d", api.fs.remove, { desc = "
-- Delete file/folder" })
-- Rename file or folder
-- vim.keymap.set("n", "r", api.fs.rename, { desc = "Rename file/folder" })
-- Refresh the tree
-- vim.keymap.set("n", "R", api.tree.reload, { desc = "Refresh NvimTree" })
-- Collapse all folders
-- vim.keymap.set("n", "z", api.tree.collapse_all, { desc
-- = "Collapse all folders" })
-- Toggle hidden files
-- vim.keymap.set("n", "H", api.tree.toggle_hidden_filter, { desc
-- = "Toggle hidden files" })
-- Preview file in a floating window
-- vim.keymap.set("n", "p", api.node.open.preview, { desc =
-- "Preview file" })
-- Copy file path to clipboard
-- vim.keymap.set("n", "y", api.fs.copy.node, { desc =
-- "Copy file/folder" })
-- Paste file or folder
-- vim.keymap.set("n", "x", api.fs.paste, { desc =
-- "Paste file/folder" })
-- Cut file or folder
-- vim.keymap.set("n", "c", api.fs.cut, { desc =
-- "Cut file/folder" })
-- Open terminal in the current file's directory
-- vim.keymap.set("n", "t", api.tree.open_terminal, { desc =
-- "Open terminal" })
-- Go up one directory
-- vim.keymap.set("n", "u", api.tree.change_root_to_parent, {
