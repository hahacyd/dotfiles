return {
  { "vim-airline/vim-airline" },
  {
    "morhetz/gruvbox",
    config = function()
      vim.cmd.colorscheme("gruvbox")
      vim.cmd[[highlight NormalFloat NONE]]
    end,
  },
  {
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
    config = function()
      local actions = require("telescope.actions")
      local open_with_trouble = require("trouble.sources.telescope").open

      -- Use this to add more results without clearing the trouble list
      local add_to_trouble = require("trouble.sources.telescope").add

      local telescope = require("telescope")

      telescope.setup {
        defaults = {
          mappings = {
            i = { ["<C-t>"] = open_with_trouble },
            n = { ["<C-t>"] = open_with_trouble },
          },
        },
      }
    end,
  },
  { "tridactyl/vim-tridactyl" },
  { "nvim-neotest/nvim-nio" },
  { "djoshea/vim-autoread" },
  { "simeji/winresizer" },
  {
    "Pocco81/auto-save.nvim",
    config = function()
      require("auto-save").setup {
        -- your config goes here
        -- or just leave it empty :)
        execution_message = {
          message = function() -- message to print on save
            -- return ("AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"))
            return ("")
          end,
          -- dim = 0.18, -- dim the color of `message`
          -- cleaning_interval = 1250, -- (milliseconds) automatically clean MsgArea after displaying `message`. See :h MsgArea
        },
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
