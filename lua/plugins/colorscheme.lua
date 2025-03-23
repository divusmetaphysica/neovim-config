-- stylua: ignore
-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
return {
  { "catppuccin/nvim", lazy = true, name = "catppuccin", priority = 1000 },
  {
    "222folke/tokyonight.nvim",
    priority = 1000,
    config = function()
      --@diagnostic disable-next-line: missing-fields
      require("tokyonight").setup {
        styles = {
          comments = { italic = false }, -- disable italics in comments
        }
      }
    end
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight-moon"
    }
  }
}
