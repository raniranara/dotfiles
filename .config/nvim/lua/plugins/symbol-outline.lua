return {
  "simrat39/symbols-outline.nvim",
  cmd = "SymbolsOutline",
  keys = {
    { "<C-\\>", ":SymbolsOutline<CR>", desc = "Toggle Symbols Outline", silent = true },
  },
  config = function()
    require("symbols-outline").setup({
      highlight_hovered_item = true,
      show_guides = true,
      auto_preview = false,
      position = "right",
      width = 25,
      show_numbers = false,
      show_relative_numbers = false,
      show_symbol_details = true,
      keymaps = {
        close = { "<Esc>", "q" },
        goto_location = "<Cr>",
        focus_location = "o",
        hover_symbol = "<C-space>",
        toggle_preview = "K",
        rename_symbol = "r",
        code_actions = "a",
      },
      lsp_blacklist = {},
    })
  end,
}
