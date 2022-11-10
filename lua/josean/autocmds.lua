local myAutoGroup = vim.api.nvim_create_augroup("myAutoGroup", {
  clear = true,
})

local autocmd = vim.api.nvim_create_autocmd

-- match-tag
-- vim.cmd([[
-- let g:vsnip_snippet_dir = "~/.config/nvim/snippet/"
-- ]])

-- Highlight on yank
autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = myAutoGroup,
  pattern = "*",
})

-- 用o换行不要延续注释
autocmd("BufEnter", {
  group = myAutoGroup,
  pattern = "*",
  callback = function()
    vim.opt.formatoptions = vim.opt.formatoptions
      - "o" -- O and o, don't continue comments
      + "r" -- But do continue when pressing enter.
  end,
})

-- 进入Insert模式切换为绝对行号
autocmd("InsertEnter", {
  group = myAutoGroup,
  pattern = "*",
  callback = function()
    vim.wo.relativenumber = false
  end,
})

-- 退出Insert模式切换为相对行号
autocmd("InsertLeave", {
  group = myAutoGroup,
  pattern = "*",
  callback = function()
    vim.wo.relativenumber = true
  end,
})
