return {
    {
        "hrsh7th/cmp-nvim-lsp"
    },
    {
        "L3MON4D3/LuaSnip",
        dependencies = {
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets",
        },
    },
    {
        "hrsh7th/nvim-cmp",
        version = false,
        config = function()
            local cmp = require("cmp")
            require("luasnip.loaders.from_vscode").lazy_load()

            cmp.setup({
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" }, -- For luasnip users.
                }, {
                    { name = "buffer" },
                }),
            })
        end,
    },
}


--
-- return {
--     {
--         "L3MON4D3/LuaSnip",
--         version = "v2.*",
--         build = "make install_jsregexp",
--
--         dependencies = { "rafamadriz/friendly-snippets" },
--
--         config = function()
--             local ls = require("luasnip")
--
--             -- Extend filetypes for better snippet support
--             ls.filetype_extend("javascript", { "jsdoc", "javascriptreact", "html" })
--             ls.filetype_extend("typescript", { "typescriptreact" })
--             ls.filetype_extend("python", { "django" }) -- For Django support in Python
--             ls.filetype_extend("javascriptreact", { "nextjs" }) -- Next.js support
--             ls.filetype_extend("typescriptreact", { "nextjs" }) -- Next.js for TypeScript
--             ls.filetype_extend("css", { "tailwind", "daisyui" }) -- DaisyUI snippets
--             ls.filetype_extend("javascriptreact", { "mui", "shadcn", "magicui", "aceternity" })
--             ls.filetype_extend("typescriptreact", { "mui", "shadcn", "magicui", "aceternity" })
--
--
--             -- Load friendly-snippets
--             require("luasnip.loaders.from_vscode").lazy_load()
--
--             -- Add a custom snippet
--             -- ls.add_snippets("javascript", {
--             --     ls.parser.parse_snippet("log", "console.log('$1');"),
--             -- })
--
--             -- Keybindings
--             vim.keymap.set({"i"}, "<C-s>e", function() ls.expand() end, {silent = true})
--             vim.keymap.set({"i", "s"}, "<C-s>;", function() ls.jump(1) end, {silent = true})
--             vim.keymap.set({"i", "s"}, "<C-s>,", function() ls.jump(-1) end, {silent = true})
--
--             vim.keymap.set({"i", "s"}, "<C-E>", function()
--                 if ls.choice_active() then
--                     ls.change_choice(1)
--                 end
--             end, {silent = true})
--         end,
--     }
-- }
--
