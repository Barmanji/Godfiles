return {
    -- HACK: docs @ https://github.com/folke/snacks.nvim/blob/main/docs
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        -- NOTE: Options
        opts = {
            explorer = {
                enabled = true,
                layout = {
                    cycle = true,
                }
            },
            quickfile = {
                enabled = true,
                exclude = { "latex" },
            },
            -- HACK: read picker docs @ https://github.com/folke/snacks.nvim/blob/main/docs/picker.md
            picker = {
                enabled = true,
                formatters = {
                    file = {
                        filename_first = false,
                        filename_only = false,
                        icon_width = 2,
                    },
                },
                layout = {
                    -- presets options : "default" , "ivy" , "ivy-split" , "telescope" , "vscode", "select" , "sidebar"
                    -- override picker layout in keymaps function as a param below
                    preset = "telescope", -- defaults to this layout unless overidden
                    cycle = true,
                },
                layouts = {
                    select = {
                        preview = false,
                        layout = {
                            backdrop = false,
                            width = 0.6,
                            min_width = 80,
                            height = 0.4,
                            min_height = 10,
                            bo = "vertical",
                            border = "rounded",
                            title = "{title}",
                            title_pos = "center",
                            { win = "input",   height = 1,          border = "bottom" },
                            { win = "list",    border = "none" },
                            { win = "preview", title = "{preview}", width = 0.6,      height = 0.4, border = "top" },
                        }
                    },
                    telescope = {
                        reverse = true, -- set to false for search bar to be on top
                        layout = {
                            box = "horizontal",
                            backdrop = false,
                            width = 0.8,
                            height = 0.85,
                            border = "none",
                            {
                                box = "vertical",
                                { win = "list",  title = " Results ", title_pos = "center", border = "rounded" },
                                { win = "input", height = 1,          border = "rounded",   title = "{title} {live} {flags}", title_pos = "center" },
                            },
                            {
                                win = "preview",
                                title = "{preview:Preview}",
                                width = 0.50,
                                border = "rounded",
                                title_pos = "center",
                            },
                        },
                    },
                    ivy = {
                        layout = {
                            box = "vertical",
                            backdrop = false,
                            width = 0,
                            height = 0.4,
                            position = "bottom",
                            border = "top",
                            title = " {title} {live} {flags}",
                            title_pos = "left",
                            { win = "input", height = 1, border = "bottom" },
                            {
                                box = "horizontal",
                                { win = "list",    border = "none" },
                                { win = "preview", title = "{preview}", width = 0.5, border = "left" },
                            },
                        },
                    },
                }
            },
            dashboard = {
                enabled = false,
                sections = {
                    { section = "header" },
                    { section = "keys",   gap = 1, padding = 1 },
                    { section = "startup" },
                    {
                        section = "terminal",
                        cmd = "ascii-image-converter ~/Desktop/Others/profiles.JPG -C -c",
                        random = 10,
                        pane = 2,
                        indent = 4,
                        height = 30,
                    },
                },
            },
        },
        -- NOTE: Keymaps
        keys = {
            { "<leader><leader>", function() require("snacks").picker.buffers() end,                                 desc = "Find existing buffers" },
            { "<leader>fr",       function() require("snacks").picker.recent() end,                                  desc = "Recent" },

            -- { "<leader><space>", function() require("snacks").picker.smart() end,                                              desc = "Smart Find Files" },
            { "<leader>lg",       function() require("snacks").lazygit() end,                                        desc = "Lazygit" },
            { "<leader>gl",       function() require("snacks").lazygit.log() end,                                    desc = "Lazygit Logs" },
            { "<leader>es",       function() require("snacks").explorer() end,                                       desc = "Open Snacks Explorer" },
            { "<leader>rN",       function() require("snacks").rename.rename_file() end,                             desc = "Fast Rename Current File" },
            { "<leader>dB",       function() require("snacks").bufdelete() end,                                      desc = "Delete or Close Buffer  (Confirm)" },

            -- Snacks Picker
            { "<leader>pf",       function() require("snacks").picker.files() end,                                   desc = "Find Files (Snacks Picker)" },
            { "<leader>pn",       function() require("snacks").picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Nvim Config File" },
            { "<leader>ps",       function() require("snacks").picker.grep() end,                                    desc = "Grep word" },
            { "<leader>pws",      function() require("snacks").picker.grep_word() end,                               desc = "Search Visual selection or Word",  mode = { "n", "x" } },
            { "<leader>pk",       function() require("snacks").picker.keymaps() end,                                 desc = "Search Keymaps (Snacks Picker)" },

            -- Git Stuff
    { "<leader>gbr", function() require("snacks").picker.git_branches() end, desc = "Git Branches" },
    { "<leader>gl", function() require("snacks").picker.git_log() end, desc = "Git Log" },
    { "<leader>gL", function() require("snacks").picker.git_log_line() end, desc = "Git Log Line" },
    { "<leader>GS", function() require("snacks").picker.git_status() end, desc = "Git Status" },
    { "<leader>Gs", function() require("snacks").picker.git_stash() end, desc = "Git Stash" },
            -- Other Utils
            { "gd",               function() require("snacks").picker.lsp_definitions() end,                         desc = "Goto Definition" },
            { "gr",               function() require("snacks").picker.lsp_references() end,                          nowait = true,                             desc = "References" },
            { "<leader>sq",       function() require("snacks").picker.qflist() end,                                  desc = "Quickfix List" },
            { "<leader>sd",       function() require("snacks").picker.diagnostics() end,                             desc = "Diagnostics" },
            { "<leader>sD",       function() require("snacks").picker.diagnostics_buffer() end,                      desc = "Buffer Diagnostics" },
            { "<leader>th",       function() require("snacks").picker.colorschemes({ layout = "ivy" }) end,          desc = "Pick Color Schemes" },
            { "<leader>vh",       function() require("snacks").picker.help() end,                                    desc = "Help Pages" },
        }
    },
    -- NOTE: Todo comments w/ snacks
    {
        "folke/todo-comments.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = { "nvim-lua/plenary.nvim" },
        optional = true,
        config = function()
            require("todo-comments").setup({
                keywords = {
                    FIX = {
                        icon = " ",
                        color = "error",
                        alt = { "FIXME", "BUG", "FIXIT", "ISSUE" },
                    },
                    TODO = { icon = " ", color = "info" },
                    HACK = { icon = " ", color = "warning", alt = { "DON SKIP" } },
                    WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
                    PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
                    NOTE = { icon = " ", color = "hint", alt = { "INFO", "READ", "COLORS" } },
                    TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
                },
            })
        end,
        keys = {
            { "<leader>pt", function() require("snacks").picker.todo_comments() end,                                          desc = "Todo" },
            { "<leader>pT", function() require("snacks").picker.todo_comments({ keywords = { "TODO", "FIX", "FIXME" } }) end, desc = "Todo/Fix/Fixme" },
            { "]t",         function() require("todo-comments").jump_next() end,                                              desc = "Next todo comment" },
            { "[t",         function() require("todo-comments").jump_prev() end,                                              desc = "Previous todo comment" },
        },
    },
    -- NOTE: Zen-Mode
    {
        "folke/zen-mode.nvim",
        config = function()
            vim.keymap.set("n", "<leader>zz", function()
                require("zen-mode").setup {
                    window = {
                        width = 90,
                        options = {}
                    },
                }
                require("zen-mode").toggle()
                vim.wo.wrap = false
                vim.wo.number = true
                vim.wo.rnu = true
                ColorMyPencils()
            end)


            vim.keymap.set("n", "<leader>zZ", function()
                require("zen-mode").setup {
                    window = {
                        width = 80,
                        options = {}
                    },
                }
                require("zen-mode").toggle()
                vim.wo.wrap = false
                vim.wo.number = false
                vim.wo.rnu = false
                vim.opt.colorcolumn = "0"
                ColorMyPencils()
            end)
        end
    },
    -- NOTE: Trouble
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
        opts = {
            focus = true,
        },
        cmd = "Trouble",
        keys = {
            { "<leader>tw", "<cmd>Trouble diagnostics toggle<CR>", desc = "Open trouble workspace diagnostics" },
            {
                "<leader>td",
                "<cmd>Trouble diagnostics toggle filter.buf=0<CR>",
                desc = "Open trouble document diagnostics",
            },
            { "<leader>tq", "<cmd>Trouble quickfix toggle<CR>",    desc = "Open trouble quickfix list" },
            { "<leader>tl", "<cmd>Trouble loclist toggle<CR>",     desc = "Open trouble location list" },
            { "<leader>tt", "<cmd>Trouble todo toggle<CR>",        desc = "Open todos in trouble" },
        },
    },
}
