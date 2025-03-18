return {
  -- All your plugins go here
  { "ellisonleao/gruvbox.nvim", priority = 1000 },
  
  -- Alpha dashboard
  {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")

      -- Set header with ASCII cat
      dashboard.section.header.val = {
        [[  /\_/\  ]],
        [[ ( ^.^ ) ]],
        [[  \> </  ]],
        [[ /     \ ]],
        [[/       \]],
        [[         ]],
        [[ ranranxoxo ]],
      }
      -- Set menu
      dashboard.section.buttons.val = {
        dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
        dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
        dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
        dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
        dashboard.button("c", "  Configuration", ":e $MYVIMRC <CR>"),
        dashboard.button("l", "󰒲  Lazy", ":Lazy<CR>"),
        dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
      }

      -- Footer
      local function footer()
        local stats = require("lazy").stats()
        local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
        return " Loaded " .. stats.count .. " plugins in " .. ms .. "ms"
      end

      dashboard.section.footer.val = footer()
      dashboard.section.footer.opts.hl = "Type"
      dashboard.section.header.opts.hl = "String"
      dashboard.section.buttons.opts.hl = "Keyword"
      dashboard.opts.opts.noautocmd = true

      -- Send config to alpha
      alpha.setup(dashboard.opts)

      -- Auto start alpha when no arguments provided
      vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
          local should_skip = false
          -- Skip if buffer is not empty or arguments given
          if vim.fn.argc() > 0 or vim.fn.line2byte('$') ~= -1 or not vim.o.modifiable then
            should_skip = true
          end

          if not should_skip then
            require('alpha').start()
          end
        end,
        once = true
      })
    end,
  },
  
  -- Add any other plugins you need here
}
