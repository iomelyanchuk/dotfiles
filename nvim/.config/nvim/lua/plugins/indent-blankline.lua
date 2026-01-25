return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  ---@module "ibl"
  ---@type ibl.config
  opts = {},
  config = function()
    require("ibl").setup {
      indent = { char = "┊" },
      -- scope =  { exclude = { language = { "yaml", }, }, },
      scope = { enabled = false },
    }
  end
}
