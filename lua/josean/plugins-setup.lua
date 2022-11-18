local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
-- vim.cmd([[
-- augroup packer_user_config
-- autocmd!
-- autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
-- augroup end
-- ]])
--
-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
  return
end

-- add list of plugins to install
return packer.startup(function(use)
  -- packer can manage itself
  use("wbthomason/packer.nvim")

  use("nvim-lua/plenary.nvim") -- lua functions that many plugins use
  use("christoomey/vim-tmux-navigator") -- tmux & split window navigation

  -- essential plugins
  -- use("tpope/vim-surround") -- add, delete, change surroundings (it's awesome)
  use("kylechui/nvim-surround")

  use("vim-scripts/ReplaceWithRegister") -- replace with register contents using motion (gr + motion)

  -- commenting with gc
  use("numToStr/Comment.nvim")

  -- file explorer
  use("nvim-tree/nvim-tree.lua")

  -- vs-code like icons
  use("kyazdani42/nvim-web-devicons")

  -- statusline
  use("nvim-lualine/lualine.nvim")

  -- fuzzy finding w/ telescope
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting performance
  use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" }) -- fuzzy finder
  use("ahmedkhalf/project.nvim")

  use("MattesGroeger/vim-bookmarks")
  use("tom-anders/telescope-vim-bookmarks.nvim")

  -- autocompletion
  use("hrsh7th/nvim-cmp") -- completion plugin
  use("hrsh7th/cmp-buffer") -- source for text in buffer
  use("hrsh7th/cmp-path") -- source for file system paths
  use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }
  use("octaltree/cmp-look")
  use("hrsh7th/cmp-emoji")
  use("hrsh7th/cmp-calc")
  use("hrsh7th/cmp-vsnip")

  -- snippets
  use("hrsh7th/vim-vsnip")
  use("rafamadriz/friendly-snippets")

  -- managing & installing lsp servers, linters & formatters
  use("williamboman/mason.nvim") -- in charge of managing lsp servers, linters & formatters
  use("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig

  -- configuring lsp servers
  use("neovim/nvim-lspconfig") -- easily configure language servers
  use("hrsh7th/cmp-nvim-lsp") -- for autocompletion
  use({ "glepnir/lspsaga.nvim", branch = "main" }) -- enhanced lsp uis
  use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)
  use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion

  -- formatting & linting
  use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
  use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls

  -- treesitter configuration
  --
  use("p00f/nvim-ts-rainbow")
  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  })

  -- auto closing
  use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
  use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags

  -- git integration
  use("lewis6991/gitsigns.nvim") -- show line modifications on left hand side

  -- auto save
  use("Pocco81/auto-save.nvim")

  -- bufferline
  use({ "akinsho/bufferline.nvim", requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" } })

  -- dashboard
  use("glepnir/dashboard-nvim")

  -- 半透明
  use("xiyaowong/nvim-transparent")

  -- use("projekt0n/github-nvim-theme")
  use("sainnhe/edge")

  use("davidgranstrom/nvim-markdown-preview")

  -- picgo
  use("askfiy/nvim-picgo")

  -- 显示颜色
  use("norcalli/nvim-colorizer.lua") -- nvim-tree

  -- 移动文本
  use("booperlv/nvim-gomove")

  -- editconfig
  use("editorconfig/editorconfig-vim")

  -- 自动恢复光标位置
  use("ethanholz/nvim-lastplace")

  -- use 显示光标下相同词汇
  use("RRethy/vim-illuminate")

  -- match tag
  use("leafOfTree/vim-matchtag")

  -- 记录历史变更
  use("mbbill/undotree")

  -- indent-blankline
  use("lukas-reineke/indent-blankline.nvim")

  -- jsdoc
  use({
    "kkoomen/vim-doge",
  })

  -- gitgraph
  use("tpope/vim-fugitive")
  use("rbong/vim-flog")

  -- git configlict
  use("rhysd/conflict-marker.vim")

  -- hop
  use("phaazon/hop.nvim")

  -- reset
  use("NTBBloodbath/rest.nvim")

  -- JSON 增强
  use("b0o/schemastore.nvim")

  use("mg979/vim-visual-multi")

  use("rmagatti/auto-session")

  if packer_bootstrap then
    require("packer").sync()
  end
end)
