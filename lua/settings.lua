vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.termguicolors = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.o.guifont = "JetBrainsMono Nerd Font:h12"
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

-- Auto-save buffer when it loses focus (BufLeave event)
vim.api.nvim_create_autocmd("BufLeave", {
  pattern = "*",
  callback = function()
    if vim.bo.modifiable and vim.bo.modified then
      vim.cmd("silent! write")
    end
  end
})

-- Copilot settings for accepting suggestions with Ctrl + j
vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-j>", 'copilot#Accept("<CR>")', { silent = true, expr = true, noremap = true })
