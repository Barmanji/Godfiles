return {
    "lukas-reineke/indent-blankline.nvim",
    name = "indent-blankline",
    config = function()
        require("ibl").setup({
            indent = {
                char = "│", -- Character for indent lines
            },
            exclude = {
                filetypes = { "help", "startify", "dashboard", "packer", "neogitstatus" }, -- Excluded file types
                buftypes = { "terminal", "nofile" }, -- Excluded buffer types
            },
            scope = {
                enabled = true, -- Enable scope highlighting
                show_start = true, -- Show the start of the current scope
                show_end = false, -- Optionally show the end of the scope
            },
        })
    end,
}
