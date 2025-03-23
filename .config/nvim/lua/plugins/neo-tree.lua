return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
  },
  opts = {
    filesystem = {
      filtered_items = {
        hide_dotfiles = false,  -- Show dotfiles
        hide_gitignored = false,  -- Show Git ignored files
      },
      window = {
        mappings = {
          ['\\'] = 'close_window',
          ['o'] = function(state)
            local node = state.tree:get_node()
            local path = node:get_id()
            require('neo-tree.sources.filesystem.commands').open(state)
          end,
        },
      },
    },
  },
}
