return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  -- config = function()
  --   local configs = require("nvim-treesitter.setup")
  --   configs.setup({
  --     ensure_installed = { "vim", "regex", "lua", "bash", "markdown", "markdown_inline" },
  --     sync_install = false,
  --     auto_install = true,
  --     highlight = { enable = true },
  --     indent = { enable = true },
  --   })
  -- end
}
