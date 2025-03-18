return {
    "MeanderingProgrammer/render-markdown.nvim",
    config = function()
        require("render-markdown").setup({
            -- Add your configuration here
        })
    end,
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-lua/plenary.nvim",
    }
}

