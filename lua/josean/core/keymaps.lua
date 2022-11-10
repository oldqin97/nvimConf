-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymapske
---------------------

-- use jk to exit insert mode
keymap.set("i", "jj", "<ESC>")

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>") -- increment
keymap.set("n", "<leader>-", "<C-x>") -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") --  go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") --  go to previous tab

-- visual模式下缩进代码
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")
-- 上下移动选中文本
keymap.set("v", "J", ":move '>+1<CR>gv-gv")
keymap.set("v", "K", ":move '<-2<CR>gv-gv")

-- $跳到行尾不带空格 (交换$ 和 g_)
keymap.set("v", "H", "^")
keymap.set("v", "L", "$")
keymap.set("n", "H", "^")
keymap.set("n", "L", "$")

-- bufferline
-- 左右Tab切换
keymap.set("n", "<A-h>", ":BufferLineCyclePrev<CR>")
keymap.set("n", "<A-l>", ":BufferLineCycleNext<CR>")
-- 关闭
--"moll/vim-bbye"
keymap.set("n", "<A-q>", ":Bdelete!<CR>")

-- 格式化
keymap.set("n", "<A-s>", "<cmd>lua vim.lsp.buf.formatting()<CR>")
keymap.set("v", "<A-s>", "<cmd>lua vim.lsp.buf.formatting()<CR>")
keymap.set("i", "<A-s>", "<cmd>lua vim.lsp.buf.formatting()<CR>")

-- 预览markdown
keymap.set("n", "<C-A-p>", "<cmd>MarkdownPreview github<CR>")

-- picgo
keymap.set("n", "<leader>u", "<cmd>lua require'nvim-picgo'.upload_clipboard()<cr>")
keymap.set("n", "<leader>e", "<cmd>lua require'nvim-picgo'.upload_imagefile()<cr>")

-- comment
keymap.set("n", "<A-/>", "gcc<Esc>")
keymap.set("v", "<A-/>", "gcc<Esc>")

----------------------
-- Plugin Keybinds
----------------------

-- nvim-tree
keymap.set("n", "<A-w>", ":NvimTreeToggle<CR>") -- toggle file explorer

-- telescope
keymap.set("n", "<A-p>", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags

-- telescope git commands (not on youtube nvim video)
keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview ["gs" for git status]

-- restart lsp server (not on youtube nvim video)
keymap.set("n", "<leader>rs", ":LspRestart<CR>") -- mapping to restart lsp if necessary
