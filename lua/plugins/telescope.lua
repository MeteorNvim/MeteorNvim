return {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.4',
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-file-browser.nvim",
            "nyarthan/telescope-code-actions.nvim"
        },
        config = function()
            require("plugins.config.telescope")
        end
    },
    {
        "MeteorNvim/telescope-theme-switcher",
        dependencies = { 'nvim-telescope/telescope.nvim' },
        config = function()
            require('telescope').load_extension('theme_switcher')
        end
    }
}
