return {
  'andweeb/presence.nvim',
  lazy = false,
  config = function()
    require('presence'):setup({
      auto_update         = true,
      editing_text        = "Typing...",
      file_explorer_text  = "Browsing...",
      git_commit_text     = "Committing changes",
      plugin_manager_text = "Managing plugins",
      reading_text        = "Thinking...",
      workspace_text      = "Working on stuff"
    })
  end
}
