return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        
        -- Web Development
        html = { "htmlbeautifier", "prettier" },
        css = { "prettier" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        tsx = { "prettier" },
        jsx = { "prettier" },
        json = { "prettier" },
        
        -- Ruby
        ruby = { "rubocop", "standardrb" },
        
        -- Java
        java = { "google-java-format" },
      },
    },
  },
}
