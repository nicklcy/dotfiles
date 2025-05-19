# bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  {
    "neoclide/coc.nvim",
    branch = "release",
    dependencies = {
      "rafamadriz/friendly-snippets"
    }
  },
  {
    "nvim-treesitter/nvim-treesitter",
    "nvim-treesitter/playground",
  },
  "L3MON4D3/LuaSnip",
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim"
    }
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"}
  },
  "mfussenegger/nvim-dap-python",

  "numToStr/Comment.nvim",
  { "phaazon/hop.nvim", branch = "v2" },
  "Vonr/align.nvim",

  "lervag/vimtex",
  {
    "chomosuke/typst-preview.nvim",
    lazy = false, -- or ft = "typst"
    version = "1.*",
    build = function() require "typst-preview".update() end,
  },

  "lambdalisue/suda.vim",

  "shaunsingh/nord.nvim",
  "kyazdani42/nvim-web-devicons",
  "nvim-lualine/lualine.nvim",
  "akinsho/bufferline.nvim",

  "kyazdani42/nvim-tree.lua",
  "akinsho/toggleterm.nvim",
  "jlanzarotta/bufexplorer",
  "rcarriga/nvim-notify",

  {
    "m4xshen/hardtime.nvim",
    lazy = false,
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = {
      disable_mouse = false,
      max_time = 750,
    },
  },
}

require("lazy").setup(plugins)

local plugin_files = { "nord", "lualine", "nvim-tree",
  "bufferline", "Comment", "hop", "toggleterm",
  "treesitter", "vimtex", "align",
  "coc-nvim", "dap", "notify" }
for i = 1, #plugin_files do
  local plugin = plugin_files[i]
  -- print("Load plugin config file: "..plugin)
  require("plugin_config/" .. plugin)
end
