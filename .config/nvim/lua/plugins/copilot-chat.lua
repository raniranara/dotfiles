return {
  "CopilotC-Nvim/CopilotChat.nvim",
  dependencies = { "github/copilot.vim" },
  config = function()
    require("CopilotChat").setup()

    -- Keybinding to open Copilot Chat
    vim.api.nvim_set_keymap("n", "<leader>cc", ":CopilotChat<CR>", { noremap = true, silent = true })
  end,
}

