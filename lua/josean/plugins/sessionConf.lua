local status, session = pcall(require, "auto-session")
if not status then
  return
end

vim.cmd([[
let g:auto_session_root_dir = '/Users/qin/.config/nvim/session'
]])
session.setup({
  log_level = "error",
  auto_session_enable_last_session = false,
  auto_session_enabled = true,
  auto_save_enabled = nil,
  auto_restore_enabled = nil,
  auto_session_suppress_dirs = nil,
  auto_session_use_git_branch = nil,
  -- the configs below are lua only
  bypass_session_save_file_types = nil,
})
