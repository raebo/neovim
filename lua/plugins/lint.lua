return {
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        -- Web Development
        javascript = { "eslint_d" },
        typescript = { "eslint_d" },
        tsx = { "eslint_d" },
        
        -- Ruby
        ruby = { "ruby" },
        
        -- CSS/HTML
        css = { "stylelint" },
        html = { "htmlhint" },
      },
    },
  },
}
