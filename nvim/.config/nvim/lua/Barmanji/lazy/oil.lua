return {
    "stevearc/oil.nvim",
    -- enabled = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("oil").setup({
            float = {
                max_width = 120, -- Adjust width
                max_height = 30, -- Adjust height
                border = "rounded", -- Optional: make the border rounded
            },
            default_file_explorer = true, -- start up nvim with oil instead of netrw
            columns = {
                -- "icon",
                -- "permissions",
                -- "size",
                -- "mtime",
            },
            keymaps = {
                ["<C-h>"] = false,
                ["<C-c>"] = false, -- prevent from closing Oil as <C-c> is esc key
                ["<M-h>"] = "actions.select_split",
                ["<C-s>"] = { "actions.select", opts = { vertical = true } },
                ["gg"] = { "actions.change_sort", mode = "n" },
                ["q"] = "actions.close",
            },
            delete_to_trash = true,
            view_options = {
                show_hidden = true,
            },
            skip_confirm_for_simple_edits = true,
        })

        -- opens parent dir over current active window
        vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
        -- open parent dir in float window
        vim.keymap.set("n", "<leader>-", require("oil").toggle_float)
        vim.api.nvim_create_autocmd("FileType", {
            pattern = "oil", -- Adjust if Oil uses a specific file type identifier
            callback = function()
                vim.cmd("highlight OilBorder guifg=white guibg=NONE")
                vim.cmd("highlight CursorLineNr guifg=white")
            end,
        })
    end,
}
