return {
  {
    "rhysd/git-messenger.vim",
    -- cmd = "GitMessenger",
    config = function()
      -- vim.g.git_messenger_no_default_mappings = true
      local u = require("core.utils")
      u.keymap("n", "<leader>gm", "<Cmd>GitMessenger<CR>", u.opts, "[GitMessenger] GitMessenger")
      vim.cmd[[hi gitmessengerPopupNormal NONE]]
      vim.cmd[[hi link gitmessengerPopupNormal Pmenu]]
    end,
  },
  -- fugitive does not need to setup
  { "tpope/vim-fugitive" },
  { "junegunn/gv.vim"},
}
