return {
    {
        "akinsho/bufferline.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        },
        tag = "v4.5.3",
        config = function()
            require("plugins.config.bufferline")
        end
    },
}
