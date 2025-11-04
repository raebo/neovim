return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- LSP Servers
        "html-lsp",
        "css-lsp", 
        "typescript-language-server",
        "json-lsp",
        "ruby-lsp",
        "jdtls",
        
        -- Formatters
        "stylua",
        "prettier",
        "htmlbeautifier",
        "rubocop",
        "standardrb",
        "google-java-format",
        
        -- Linters
        "eslint_d",
        "stylelint",
        "htmlhint",
      },
    },
  },
}
