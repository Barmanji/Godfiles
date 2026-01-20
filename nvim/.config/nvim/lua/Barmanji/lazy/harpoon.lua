return {
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local harpoon = require("harpoon")

            -- Setup Harpoon
            harpoon:setup()

            -- Keybindings for Harpoon"
            vim.keymap.set("n", "<leader>A", function() harpoon:list():prepend() end)
            vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
            vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

            vim.keymap.set("n", "<A-1>", function() harpoon:list():select(1) end)
            vim.keymap.set("n", "<A-2>", function() harpoon:list():select(2) end)
            vim.keymap.set("n", "<A-3>", function() harpoon:list():select(3) end)
            vim.keymap.set("n", "<A-4>", function() harpoon:list():select(4) end)
            vim.keymap.set("n", "<A-5>", function() harpoon:list():select(5) end)
            vim.keymap.set("n", "<A-6>", function() harpoon:list():select(6) end)
            vim.keymap.set("n", "<A-7>", function() harpoon:list():select(7) end)
            vim.keymap.set("n", "<A-8>", function() harpoon:list():select(8) end)
            vim.keymap.set("n", "<A-9>", function() harpoon:list():select(9) end)

            -- H,J,K,L

            vim.keymap.set("n", "<A-h>", function() harpoon:list():select(1) end)
            vim.keymap.set("n", "<A-j>", function() harpoon:list():select(2) end)
            vim.keymap.set("n", "<A-k>", function() harpoon:list():select(3) end)
            vim.keymap.set("n", "<A-l>", function() harpoon:list():select(4) end) -- Navigate previous and next buffers stored in Harpoon list
            vim.keymap.set("n", "<C-S-P>", function() require('harpoon.ui').nav_prev() end)
            vim.keymap.set("n", "<C-S-N>", function() require('harpoon.ui').nav_next() end)
            vim.keymap.set("n", "<leader><A-1>", function() harpoon:list():replace_at(1) end)
            vim.keymap.set("n", "<leader><A-2>", function() harpoon:list():replace_at(2) end)
            vim.keymap.set("n", "<leader><A-3>", function() harpoon:list():replace_at(3) end)
            vim.keymap.set("n", "<leader><A-4>", function() harpoon:list():replace_at(4) end)
            vim.keymap.set("n", "<leader><A-5>", function() harpoon:list():replace_at(5) end)
            vim.keymap.set("n", "<leader><A-6>", function() harpoon:list():replace_at(6) end)
            vim.keymap.set("n", "<leader><A-7>", function() harpoon:list():replace_at(7) end)
            vim.keymap.set("n", "<leader><A-8>", function() harpoon:list():replace_at(8) end)
            vim.keymap.set("n", "<leader><A-9>", function() harpoon:list():replace_at(9) end)

            vim.keymap.set("n", "<leader><A-h>", function() harpoon:list():replace_at(1) end)
            vim.keymap.set("n", "<leader><A-j>", function() harpoon:list():replace_at(2) end)
            vim.keymap.set("n", "<leader><A-k>", function() harpoon:list():replace_at(3) end)
            vim.keymap.set("n", "<leader><A-l>", function() harpoon:list():replace_at(4) end)
        end,
    },
    {
        "theprimeagen/vim-be-good",
        dependencies = {
            "nvim-lua/plenary.nvim"
        },

        config = function()
        end
    },
	{
		"ThePrimeagen/99",
		config = function()
			local _99 = require("99")

            -- For logging that is to a file if you wish to trace through requests
            -- for reporting bugs, i would not rely on this, but instead the provided
            -- logging mechanisms within 99.  This is for more debugging purposes
            local cwd = vim.uv.cwd()
            local basename = vim.fs.basename(cwd)
			_99.setup({
				logger = {
					level = _99.DEBUG,
					path = "/tmp/" .. basename .. ".99.debug",
					print_on_error = true,
				},

                --- WARNING: if you change cwd then this is likely broken
                --- ill likely fix this in a later change
                ---
                --- md_files is a list of files to look for and auto add based on the location
                --- of the originating request.  That means if you are at /foo/bar/baz.lua
                --- the system will automagically look for:
                --- /foo/bar/AGENT.md
                --- /foo/AGENT.md
                --- assuming that /foo is project root (based on cwd)
				md_files = {
                    "AGENTS.md",
                    "AGENT.md",
				},
			})

            -- Create your own short cuts for the different types of actions
			vim.keymap.set("n", "<leader>9f", function()
				_99.fill_in_function()
			end)
            -- take extra note that i have visual selection only in v mode
            -- technically whatever your last visual selection is, will be used
            -- so i have this set to visual mode so i dont screw up and use an
            -- old visual selection
            --
            -- likely ill add a mode check and assert on required visual mode
            -- so just prepare for it now
			vim.keymap.set("v", "<leader>9v", function()
				_99.visual()
			end)
            vim.keymap.set("n", "<leader>9i", function()
				_99.fill_in_function_prompt()
			end)

            --- if you have a request you dont want to make any changes, just cancel it
			vim.keymap.set("v", "<leader>9s", function()
				_99.stop_all_requests()
			end)
		end,
	},

}
