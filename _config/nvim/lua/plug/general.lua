return {
  {
    "morhetz/gruvbox",
    config = function()
      vim.cmd.colorscheme("gruvbox")
    end,
  },
  { "tridactyl/vim-tridactyl" },
  { "nvim-neotest/nvim-nio" },
  {
    "Pocco81/auto-save.nvim",
    config = function()
      require("auto-save").setup {
        -- your config goes here
        -- or just leave it empty :)
      }
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      local function my_on_attach(bufnr)
        local api = require("nvim-tree.api")

        local function opts(desc)
          return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end

        -- default mappings
        api.config.mappings.default_on_attach(bufnr)

        -- custom mappings
        vim.keymap.set("n", "<C-t>", api.tree.change_root_to_parent, opts("Up"))
        vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
      end
      require("nvim-tree").setup {
        on_attach = my_on_attach,
      }
      local u = require("core.utils")
      u.keymap("n", "<localleader>m", "<Cmd>NvimTreeFocus<CR>", u.opts, "[NvimTree] Focus")
    end,
    -- pass to setup along with your other options
  },
  {
    "tibabit/vim-templates",
    config = function()
      local uv = vim.uv
      vim.g.tmpl_search_paths = { vim.fn.stdpath("config") .. "templates" }
      local hostname = uv.os_gethostname()
      if vim.startswith(hostname, "hw") then
        vim.g.tmpl_author_name = vim.env.HW_NAME
        vim.g.tmpl_author_email = vim.env.EMAIL
      else
        vim.g.tmpl_author_email = vim.env.EMAIL
      end
    end,
  },

  { "nvim-lua/plenary.nvim", lazy = true },

  -- profiling
  { "dstein64/vim-startuptime", cmd = "StartupTime" },

  -- chinese punctuation replacement
  {
    "hotoo/pangu.vim",
    cmd = { "Pangu", "PanguAll" },
    config = function()
      vim.g.pangu_rule_duplicate_punctuation = 0
      vim.g.pangu_rule_spacing = 0
      vim.g.pangu_rule_date = 0
      vim.g.pangu_punctuation_brackets = {}
      vim.g.pangu_punctuation_ellipsis = {}
    end,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    cmd = "IndentBlanklineEnable",
    config = function()
      require("indent_blankline").setup {
        space_char_blankline = " ",
      }
    end,
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = true,
  },

  {
    "moll/vim-bbye",
    keys = {
      { "<leader>qq", "<Cmd>Bdelete<CR>", desc = "delete buffer nicely" },
    },
  },

  { "kyazdani42/nvim-web-devicons", lazy = true },
  {
    "mortepau/codicons.nvim",
    config = true,
  },

  -- unix operation utilities(auto configured)
  { "tpope/vim-eunuch" },
}
