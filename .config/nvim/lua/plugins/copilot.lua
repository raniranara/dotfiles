return {
  "github/copilot.vim",
  lazy = false,  -- Load the plugin immediately
  config = function()
    vim.g.copilot_enabled = false
    vim.g.copilot_filetypes = {
      markdown = false,
      text = false,
    }
  end,
}

