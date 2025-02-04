return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {
    },
    scope = {
        enabled = true, -- Disable scope highlighting
        show_start = true,
        show_end = true,
        highlight = "Normal", -- Set default highlight group for the scope (Normal is default)
    },
}
