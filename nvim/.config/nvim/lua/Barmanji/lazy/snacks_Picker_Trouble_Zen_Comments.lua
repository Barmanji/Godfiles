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
            image = {
                formats = {
                    "png",
                    "jpg",
                    "jpeg",
                    "gif",
                    "bmp",
                    "webp",
                    "tiff",
                    "heic",
                    "avif",
                    "mp4",
                    "mov",
                    "avi",
                    "mkv",
                    "webm",
                    "pdf",
                },
                force = false,
                doc = {
                    -- enable image viewer for documents
                    -- a treesitter parser must be available for the enabled languages.
                    -- supported language injections: markdown, html
                    enabled = false,
                    -- render the image inline in the buffer
                    -- if your env doesn't support unicode placeholders, this will be disabled
                    -- takes precedence over `opts.float` on supported terminals
                    inline = false,
                    -- render the image in a floating window
                    -- only used if `opts.inline` is disabled
                    float = false,
                    max_width = 80,
                    max_height = 40,
                    -- Set to `true`, to conceal the image text when rendering inline.
                    -- (experimental)
                    conceal = false,
                },
            },
            quickfile = {
                enabled = true,
                exclude = { "latex" },
            },
            -- HACK: read picker docs @ https://github.com/folke/snacks.nvim/blob/main/docs/picker.md
            picker = {
                main = {
                    file = false
                },
                sources = {
                    explorer = {
                        layout = { layout = { position = "right" } },
                        win = {
                            list = {
                                keys = {
                                    ["<BS>"] = "explorer_up", -- BasckSpace
                                    ["l"] = "confirm",
                                    ["h"] = "explorer_close", -- close directory
                                    ["-"] = "explorer_close", -- close directory
                                    ["a"] = "explorer_add",   -- FOLDER ADD
                                    ["o"] = "explorer_add",
                                    ["d"] = "explorer_del",
                                    ["r"] = "explorer_rename",
                                    ["c"] = "explorer_copy",
                                    ["m"] = "explorer_move",
                                    ["O"] = "explorer_open", -- open with system application
                                    ["P"] = "toggle_preview",
                                    ["y"] = { "explorer_yank", mode = { "n", "x" } },
                                    ["p"] = "explorer_paste",
                                    ["u"] = "explorer_update",
                                    ["<c-c>"] = "tcd",
                                    ["<leader>/"] = "picker_grep",
                                    ["<c-t>"] = "terminal",
                                    ["F"] = "explorer_focus",
                                    ["I"] = "toggle_ignored",
                                    ["."] = "toggle_hidden",
                                    ["Z"] = "explorer_close_all",
                                    ["]g"] = "explorer_git_next",
                                    ["[g"] = "explorer_git_prev",
                                    ["]d"] = "explorer_diagnostic_next",
                                    ["[d"] = "explorer_diagnostic_prev",
                                    ["]w"] = "explorer_warn_next",
                                    ["[w"] = "explorer_warn_prev",
                                    ["]e"] = "explorer_error_next",
                                    ["[e"] = "explorer_error_prev",
                                },
                            },
                        },
                    },
                },
                enabled = false,
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
                            box = "vertical",
                            border = "rounded",
                            title = "{title}",
                            title_pos = "center",
                            { win = "input",   height = 1,          border = "bottom" },
                            { win = "list",    border = "none" },
                            { win = "preview", title = "{preview}", height = 0.4,     border = "top" },
                        },
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
                },
            },
        },
        -- NOTE: Keymaps
        keys = {
            -- Snacks Picker
            { "<leader>pf",       function() require("snacks").picker.files() end,                                   desc = "Find Files (Snacks Picker)" },
            { "<leader>pn",       function() require("snacks").picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Nvim Config File" },
            { "<leader>pg",       function() require("snacks").picker.grep() end,                                    desc = "Grep word" },
            { "<leader>pws",      function() require("snacks").picker.grep_word() end,                               desc = "Search Visual selection or Word",  mode = { "n", "x" } },
            { "<leader>pk",       function() require("snacks").picker.keymaps() end,                                 desc = "Search Keymaps (Snacks Picker)" },
            { "<leader>ps",       function() require("snacks").picker.smart() end,                                   desc = "Smart Find Files" },
            { "<leader><leader>", function() require("snacks").picker.buffers() end,                                 desc = "Find existing buffers" },
            { "<leader>pr",       function() require("snacks").picker.recent() end,                                  desc = "Recent" },
            { "<leader>ph",       function() require("snacks").picker.help() end,                                    desc = "Help Pages" },
            { "<leader>pq",       function() require("snacks").picker.qflist() end,                                  desc = "Quickfix List" },
            { "<leader>pd",       function() require("snacks").picker.diagnostics() end,                             desc = "Diagnostics" },
            { "<leader>pD",       function() require("snacks").picker.diagnostics_buffer() end,                      desc = "Buffer Diagnostics" },

            -- Git Stuff
            { "<leader>Gl",       function() require("snacks").lazygit.log() end,                                    desc = "Lazygit Logs" },
            { "<leader>lg",       function() require("snacks").lazygit() end,                                        desc = "Lazygit" },
            { "<leader>gbr",      function() require("snacks").picker.git_branches({ layout = "select" }) end,       desc = "Git Branches" },
            { "<leader>gl",       function() require("snacks").picker.git_log() end,                                 desc = "Git Log" },
            { "<leader>gL",       function() require("snacks").picker.git_log_line() end,                            desc = "Git Log Line" },
            { "<leader>GS",       function() require("snacks").picker.git_status() end,                              desc = "Git Status" },
            { "<leader>Gs",       function() require("snacks").picker.git_stash() end,                               desc = "Git Stash" },

            -- Other Utils
            { "<leader>es",       function() require("snacks").explorer() end,                                       desc = "Open Snacks Explorer" },
            { "<leader>rN",       function() require("snacks").rename.rename_file() end,                             desc = "Fast Rename Current File" },
            { "<leader>dB",       function() require("snacks").bufdelete() end,                                      desc = "Delete or Close Buffer  (Confirm)" },
            { "<leader>gd",       function() require("snacks").picker.lsp_definitions() end,                         desc = "Goto Definition" }, -- already in init.lua
            { "<leader>gr",       function() require("snacks").picker.lsp_references() end,                          nowait = true,                             desc = "References" },
            { "<leader>th",       function() require("snacks").picker.colorschemes({ layout = "ivy" }) end,          desc = "Pick Color Schemes" },
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
                    TODO = { icon = " ", color = "info", alt = { "READ", "READ ABOUT", "ABOUT", "ABOUTS" } },
                    HACK = { icon = " ", color = "warning", alt = { "DON SKIP" } },
                    WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
                    PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
                    NOTE = { icon = " ", color = "hint", alt = { "INFO", "READ", "COLORS" } },
                    TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED", "FAIL", "PASS", "APROOVE", "APROOVED" } },
                }, --
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
