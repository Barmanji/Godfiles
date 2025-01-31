return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-fzf-native.nvim",
        'nvim-tree/nvim-web-devicons',
        enabled = vim.g.have_nerd_font },
    config = function()
        require('telescope').setup({
            defaults = {

                file_ignore_patterns = { ".git/", "node_modules/", "dist/" }, -- Exclude common directories
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
        pcall(require('telescope').load_extension, 'fzf')
        pcall(require('telescope').load_extension, 'ui-select')

        local builtin = require 'telescope.builtin'
        vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
        vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
        vim.keymap.set('n', '<leader>sf', function()
            builtin.find_files({
                hidden = true  -- Include hidden files
            })
        end, { desc = '[S]earch [F]iles (including dotfiles)' })
        vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
        vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
        vim.keymap.set('n', '<leader>sg', function()
            require('telescope.builtin').live_grep({
                additional_args = function()
                    return { "--ignore-case" } -- Makes search case-insensitive
                end,
                default_text = "", -- Start with an empty search prompt
            })
        end, { desc = '[S]earch [W]ord globally with fuzzy matching' })

        vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
        vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
        vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
        vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })


        --transparency
        local transparent = { bg = "none", fg = "none" }
        vim.api.nvim_set_hl(0, "TelescopeNormal", transparent)
        vim.api.nvim_set_hl(0, "TelescopeBorder", transparent)
        vim.api.nvim_set_hl(0, "TelescopePromptNormal", transparent)
        vim.api.nvim_set_hl(0, "TelescopeResultsNormal", transparent)
        vim.api.nvim_set_hl(0, "TelescopePreviewNormal", transparent)


      -- Slightly advanced example of overriding default behavior and theme
      vim.keymap.set('n', '<leader>/', function()
        -- You can pass additional configuration to Telescope to change the theme, layout, etc.
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, { desc = '[/] Fuzzily search in current buffer' })

      -- It's also possible to pass additional configuration options.
      --  See `:help telescope.builtin.live_grep()` for information about particular keys
      vim.keymap.set('n', '<leader>s/', function()
        builtin.live_grep {
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        }
      end, { desc = '[S]earch [/] in Open Files' })

      -- Shortcut for searching your Neovim configuration files
      vim.keymap.set('n', '<leader>sn', function()
        builtin.find_files { cwd = vim.fn.stdpath 'config' }
      end, { desc = '[S]earch [N]eovim files' })
    end,

}

