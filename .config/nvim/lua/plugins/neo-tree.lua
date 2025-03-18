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
      window = {
        mappings = {
          ['\\'] = 'close_window',
          ['o'] = function(state)
            local node = state.tree:get_node()
            local path = node:get_id()
            if path:match '%.pdf$' then
              -- Use vim.system for better cross-platform compatibility
              vim.system({ 'sioyek', path }, { detach = true })
              -- Fallback for older Neovim versions that don't support vim.system
              -- vim.fn.jobstart({'sioyek', path}, {detach = true})
            else
              require('neo-tree.sources.filesystem.commands').open(state)
            end
          end,
        },
      },
    },
  },
}
