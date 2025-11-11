require("lazy").setup({
  -- UI
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("tokyonight")
    end
  },
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("lualine").setup()
    end
  },

  -- Telescope (fuzzy finder)
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>ff", function() require("telescope.builtin").find_files() end, desc = "Find files" },
      { "<leader>fg", function() require("telescope.builtin").live_grep() end,  desc = "Live grep" },
      { "<leader>bb", function() require("telescope.builtin").buffers() end,    desc = "Find buffers" },
      { "<leader>fh", function() require("telescope.builtin").help_tags() end,  desc = "Help tags" },
    },
    config = function()
      require("telescope").setup({
        defaults = {
          mappings = {
            i = {
              ["<C-j>"] = require("telescope.actions").move_selection_next,
              ["<C-k>"] = require("telescope.actions").move_selection_previous,
            }
          }
        },
        extensions = {
          recent_files = {
            -- This extension's options, see below.
          }
        }
      })
    end
  },

  {
    "smartpde/telescope-recent-files"
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "lua",
        "vim",
        "vimdoc",
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "jsdoc",
        "json",
        "ruby",
        "java",
        "jsx",
      },
    },

  },



  -- LSP + Completion
  { "neovim/nvim-lspconfig" },
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "L3MON4D3/LuaSnip" },


  -- Git
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end
  },

  -- 🔧 Mason (LSP installer)
  { "williamboman/mason.nvim",           config = true },
  { "williamboman/mason-lspconfig.nvim", config = true },

  -- 🚀 LSP core
  { "neovim/nvim-lspconfig" },

  -- ✨ Completion engine
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "saadparwaiz1/cmp_luasnip",
      "L3MON4D3/LuaSnip",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = cmp.mapping.select_next_item(),
          ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
        }),
      })
    end,
  },
  -- 🧹 Formatter
  {
    "stevearc/conform.nvim",
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          ruby = { "rubocop" },
          javascript = { "prettier" },
          typescript = { "prettier" },
          typescriptreact = { "prettier" },
          json = { "prettier" },
          html = { "prettier" },
          css = { "prettier" },
        },
      })
      vim.keymap.set("n", "<leader>f", function()
        require("conform").format({ async = true })
      end, { desc = "Format file" })
    end,
  },
  --- shows tabs buffers as cliable tabs with icons
  {
    "akinsho/bufferline.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("bufferline").setup {}
    end,
  },

  --- session handling project based
  {
    "rmagatti/auto-session",
    lazy = false,

    ---enables autocomplete for opts
    ---@module "auto-session"
    ---@type AutoSession.Config
    opts = {
      suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
      -- log_level = 'debug',
    },
  },

  --- nerdtree
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("nvim-tree").setup({
        view = { width = 30, side = "left" },
        filters = { dotfiles = false },
      })
    end,
  },

  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "rafamadriz/friendly-snippets", -- collection of pre-made snippets
    },
    config = function()
      require("luasnip").config.setup({})
      require("luasnip/loaders/from_vscode").lazy_load() -- load vscode-style snippets
    end,
  },

  ---- comment
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  },

  --- toggle term
  {
    'akinsho/toggleterm.nvim', version = "*", config = true
  },

  -- github copilot
  {
    "github/copilot.vim",
    lazy = false, -- lazy loading
    config = function()
      vim.g.copilot_assume_mapped = true
    end,
  },

  -- git plugins
  {
    "tpope/vim-fugitive",
    cmd = { "Git", "Gwrite", "Gread", "Gdiffsplit", "Gblame" }
  },
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("gitsigns").setup()
    end,
  },
  {
    "sindrets/diffview.nvim",
    cmd = {
      "DiffviewOpen",
      "DiffviewClose",
      "DiffviewToggleFiles",
      "DiffviewFocusFiles",
    }
  }

})
