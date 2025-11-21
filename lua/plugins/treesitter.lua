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
      -- Install missing parsers automatically when entering buffers
      auto_install = true,
      -- Do not block startup on parser installation
      sync_install = false,
      highlight = {
        enable = true,
      }
    },
  },
}
