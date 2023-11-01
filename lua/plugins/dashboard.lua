return {
    {
        'nvimdev/dashboard-nvim',
        event = 'VimEnter',
        config = function()
            require('plugins.config.dashboard')
        end,
        dependencies = { { 'nvim-tree/nvim-web-devicons' } }
    }
}
