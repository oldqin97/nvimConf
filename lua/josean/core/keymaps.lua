-- set leader key to space
vim.g.mapleader = " "

local opt = {
  noremap = true,
  silent = true,
}
-- local keymap = vim.keymap -- for conciseness

local keymap = vim.api.nvim_set_keymap
---------------------
-- General Keymapske
---------------------

-- use jk to exit insert mode
keymap("i", "jj", "<ESC>", opt)
keymap("n", "<ESC>", ":nohlsearch<CR>", opt)

-- clear search highlights
keymap("n", "<leader>nh", ":nohl<CR>", opt)

-- delete single character without copying into register
keymap("n", "x", '"_x', opt)

-- window management
-- keymap("n", "<leader>sv", "<C-w>v", opt) -- split window vertically
-- keymap("n", "<leader>sh", "<C-w>s", opt) -- split window horizontally
-- keymap("n", "<leader>se", "<C-w>=", opt) -- make split windows equal width & height
-- keymap("n", "<leader>sx", ":close<CR>", opt) -- close current split window

-- keymap("n", "<leader>to", ":tabnew<CR>",opt) -- open new tab
-- keymap("n", "<leader>tx", ":tabclose<CR>",opt) -- close current tab
-- keymap("n", "<leader>tn", ":tabn<CR>",opt) --  go to next tab
-- keymap("n", "<leader>tp", ":tabp<CR>",opt) --  go to previous tab

-- visual模式下缩进代码
keymap("v", "<", "<gv", opt)
keymap("v", ">", ">gv", opt)
-- 上下移动选中文本
keymap("v", "J", ":move '>+1<CR>gv-gv", opt)
keymap("v", "K", ":move '<-2<CR>gv-gv", opt)
keymap("n", "<S-j>", "<Plug>GoNSMDown", opt)
keymap("n", "<S-k>", "<Plug>GoNSMUp", opt)

-- $跳到行尾不带空格 (交换$ 和 g_)
keymap("v", "H", "^", opt)
keymap("v", "L", "$", opt)
keymap("n", "H", "^", opt)
keymap("n", "L", "$", opt)

-- bufferline
-- 左右Tab切换
keymap("n", "<A-h>", ":BufferLineCyclePrev<CR>", opt)
keymap("n", "<A-l>", ":BufferLineCycleNext<CR>", opt)
-- 关闭
--"moll/vim-bbye"
keymap("n", "<A-q>", ":Bdelete!<CR>", opt)

-- 格式化
keymap("n", "<A-s>", "<cmd>lua vim.lsp.buf.formatting()<CR>", opt)
keymap("v", "<A-s>", "<cmd>lua vim.lsp.buf.formatting()<CR>", opt)
keymap("i", "<A-s>", "<cmd>lua vim.lsp.buf.formatting()<CR>", opt)

-- 预览markdown
keymap("n", "<leader>p", "<cmd>MarkdownPreview github<CR>", opt)

-- picgo
keymap("n", "<leader>u", "<cmd>lua require'nvim-picgo'.upload_clipboard()<cr>", opt)
keymap("n", "<leader>e", "<cmd>lua require'nvim-picgo'.upload_imagefile()<cr>", opt)

-- comment
keymap("n", "<A-/>", "gcc<Esc>", { noremap = false })
keymap("v", "<A-/>", "gcc<Esc>", { noremap = false })

-- 退出
keymap("n", "qq", ":q<CR>", opt)

-- 取消 s 默认功能
keymap("n", "s", "", opt)

-- jsdoc
keymap("n", "<A-d>", "<cmd>DogeGenerate<CR>", opt)

-- 移动窗口

keymap("n", "<leader>h", "<C-w>h", opt)
keymap("n", "<leader>j", "<C-w>j", opt)
keymap("n", "<leader>k", "<C-w>k", opt)
keymap("n", "<leader>l", "<C-w>l", opt)

keymap("n", "<leader>3", "<cmd>UndotreeToggle<CR>", opt)

-- 左右比例
keymap("n", "sh", ":vertical resize -10<CR>", opt)
keymap("n", "sl", ":vertical resize +10<CR>", opt)
-- 上下比例
keymap("n", "sj", ":resize +10<CR>", opt)
keymap("n", "sk", ":resize -10<CR>", opt)

-- gitgraph
keymap("n", "<leader>2", "<cmd>Flog<cr>", opt)

-- 折叠
keymap("n", "zz", ":foldclose<CR>", opt)
keymap("n", "Z", ":foldopen<CR>", opt)

-- git conflict
keymap("n", "co", "<cmd>:ConflictMarkerOurselves<cr>", opt)
keymap("n", "ct", "<cmd>:ConflictMarkerThemselves<cr>", opt)
keymap("n", "cb", "<cmd>:ConflictMarkerBoth<cr>", opt)

-- hop
keymap("n", "fw", "<cmd>HopWord<cr>", opt)
keymap("n", "fs", "<cmd>HopChar2<cr>", opt)

-- rest
keymap("n", "<leader>1", "<Plug>RestNvim", opt)

----------------------
-- Plugin Keybinds
----------------------

-- nvim-tree
keymap("n", "<A-w>", ":NvimTreeToggle<CR>", opt) -- toggle file explorer

-- telescope
keymap("n", "<A-p>", "<cmd>Telescope find_files<cr>", opt) -- find files within current working directory, respects .gitignore
keymap("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", opt) -- find string in current working directory as you type

-- keymap("n", "<leader>fc", "<cmd>Telescope grep_string<cr>",opt) -- find string under cursor in current working directory
-- keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>",opt) -- list open buffers in current neovim instance
-- keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>",opt) -- list available help tags

-- telescope git commands (not on youtube nvim video)
keymap("n", "<leader>gc", "<cmd>Telescope git_commits<cr>", opt) -- list all git commits (use <cr> to checkout) ["gc" for git commits]
keymap("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>", opt) -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
keymap("n", "<leader>gb", "<cmd>Telescope git_branches<cr>", opt) -- list git branches (use <cr> to checkout) ["gb" for git branch]
keymap("n", "<leader>gs", "<cmd>Telescope git_status<cr>", opt) -- list current changes per file with diff preview ["gs" for git status]

-- restart lsp server (not on youtube nvim video)
-- keymap("n", "<leader>rs", ":LspRestart<CR>",opt) -- mapping to restart lsp if necessary
