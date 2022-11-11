-- import nvim-tree plugin safely
local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
  return
end

-- recommended settings from nvim-tree documentation
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

-- change color for arrows in tree to light blue
vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

-- configure nvim-tree
nvimtree.setup({
  -- 完全禁止内置netrw
  disable_netrw = true,

  -- change folder arrow icons
  renderer = {
    icons = {
      glyphs = {
        git = {
          unstaged = "",
          staged = "",
          unmerged = "",
          renamed = "➜",
          deleted = "",
          untracked = "",
          ignored = "◌",
        },
        folder = {
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          arrow_closed = "", -- arrow when folder is closed
          arrow_open = "", -- arrow when folder is open
        },
      },
    },
  },
  -- disable window_picker for
  -- explorer to work well with
  -- window splits
  actions = {
    open_file = {
      window_picker = {
        enable = false,
      },
    },
  },

  -- telescope project plugin
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  git = {
    enable = true,
    timeout = 500,
  },
  --
  -- project plugin 需要这样设置
  filters = {
    -- 隐藏 .文件
    dotfiles = false,
    -- 隐藏 node_modules 文件夹
    -- custom = { "node_modules" },
    custom = {},
    exclude = { "node_modules", ".nuxt" },
  },
  view = {
    -- 宽度
    width = 30,
    -- 也可以 'right'
    side = "right",
    -- 隐藏根目录
    hide_root_folder = false,

    -- 不显示行数
    number = false,
    relativenumber = false,
    -- 显示图标
    signcolumn = "yes",
  },
})
