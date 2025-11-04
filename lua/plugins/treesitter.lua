return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        -- Basics
        "lua",
        "vim",
        "vimdoc",
        
        -- Web Development
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",           -- React TypeScript
        "jsdoc",
        "json",
        
        -- Ruby
        "ruby",
        
        -- Java
        "java",
        
        -- JSX/React
        "jsx",
      },
    },
  },
}
