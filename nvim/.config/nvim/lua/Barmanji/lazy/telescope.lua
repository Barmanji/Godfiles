return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim", -- Required dependency
        "nvim-telescope/telescope-fzf-native.nvim",
        "nvim-tree/nvim-web-devicons", -- Optional icons
        "ThePrimeagen/git-worktree.nvim", -- Git Worktree integration
    },
    config = function()
        local telescope = require("telescope")

        telescope.setup({
            defaults = {
                file_ignore_patterns = { ".git/", "node_modules/", "dist/" }, -- Ignore common directories
                layout_strategy = "flex",
                layout_config = {
                    horizontal = { preview_width = 0.5 },
                    vertical = { width = 0.9 },
                },
                mappings = {
                    i = {
                        ["<C-u>"] = false, -- Remove default clear line keybind
                    },
                },
            },
            extensions = {
                ['ui-select'] = {
                    require('telescope.themes').get_dropdown(),
                },
            },
        })

        -- Load Telescope extensions
        pcall(require("telescope").load_extension, "fzf")
        -- pcall(require("telescope").load_extension, "ui-select")
        pcall(require("telescope").load_extension, "git_worktree")

        -- Load and configure Git Worktree
        local gitworktree = require("git-worktree")
        gitworktree.setup()

        -- Keybindings for Git Worktree management
        vim.keymap.set("n", "<leader>wl", function()
            require("telescope").extensions.git_worktree.git_worktrees()
        end, { desc = "List Git Worktrees" })

        vim.keymap.set("n", "<leader>wc", function()
            require("telescope").extensions.git_worktree.create_git_worktree()
        end, { desc = "Create a new Git Worktree" })

    --     -- Search Keybindings
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>ph', builtin.help_tags, { desc = '[S]earch [H]elp' })
        vim.keymap.set('n', '<leader>pK', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
        vim.keymap.set('n', '<leader>pf', function()
            builtin.find_files({ hidden = true }) -- Include hidden files
        end, { desc = '[S]earch [F]iles (including dotfiles)' })
        vim.keymap.set('n', '<leader>pw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
        vim.keymap.set('n', '<leader>pg', function()
            builtin.live_grep({
                additional_args = function()
                    return { "--ignore-case" }
                end,
                default_text = "",
            })
        end, { desc = '[S]earch [W]ord globally with fuzzy matching' })
        vim.keymap.set('n', '<leader>pd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
        vim.keymap.set('n', '<leader>pD', builtin.resume, { desc = '[S]earch [R]esume' })
        vim.keymap.set('n', '<leader>pr', builtin.oldfiles, { desc = '[S]earch Recent Files' })
        vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

        -- Transparent UI
        local transparent = { bg = "none", fg = "none" }
        vim.api.nvim_set_hl(0, "TelescopeNormal", transparent)
        vim.api.nvim_set_hl(0, "TelescopeBorder", transparent)
        vim.api.nvim_set_hl(0, "TelescopePromptNormal", transparent)
        vim.api.nvim_set_hl(0, "TelescopeResultsNormal", transparent)
        vim.api.nvim_set_hl(0, "TelescopePreviewNormal", transparent)

        -- Fuzzy search in the current buffer
        vim.keymap.set('n', '<leader>/', function()
            builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
                winblend = 10,
                previewer = false,
            })
        end, { desc = '[/] Fuzzily search in current buffer' })

        -- Search in open files
        vim.keymap.set('n', '<leader>p/', function()
            builtin.live_grep {
                grep_open_files = true,
                prompt_title = 'Live Grep in Open Files',
            }
        end, { desc = '[S]earch [/] in Open Files' })

        -- Search Neovim config files
        vim.keymap.set('n', '<leader>pn', function()
            builtin.find_files { cwd = vim.fn.stdpath 'config' }
        end, { desc = '[S]earch [N]eovim files' })
    end,
}
