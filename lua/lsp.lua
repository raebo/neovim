local lspconfig = require("lspconfig")
local mason = require("mason")
local mason_lsp = require("mason-lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")

-- Mason setup
mason.setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "lua-language-server",
    "typescript-language-server",
    "solargraph",
    "html-lsp",
    "jsonls",
    "cssls",
    "html",
    "css-lsp",
    "json-lsp",
    "jdtls", --java
  }
})

-- Capabilities for nvim-cmp
local capabilities = cmp_nvim_lsp.default_capabilities()

-- 🛠️ LSP servers
lspconfig.lua_ls.setup({
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = { globals = { "vim" } },
      workspace = { checkThirdParty = false },
    },
  },
})

lspconfig.tsserver.setup({ capabilities = capabilities })
lspconfig.solargraph.setup({ capabilities = capabilities })
lspconfig.html.setup({})
lspconfig.cssls.setup({})
lspconfig.jsonls.setup({})

-- Diagnostics config
vim.diagnostic.config({
  float = { border = "rounded" },
  virtual_text = true,
})

-- Auto-format on save
vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})

