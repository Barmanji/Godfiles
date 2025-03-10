require("Barmanji.set")
require("Barmanji.remap")
require("Barmanji.lazy_init")
-- DO.not
-- DO NOT INCLUDE THIS

-- If i want to keep doing lsp debugging
-- function restart_htmx_lsp()
--     require("lsp-debug-tools").restart({ expected = {}, name = "htmx-lsp", cmd = { "htmx-lsp", "--level", "DEBUG" }, root_dir = vim.loop.cwd(), });
-- end

-- DO NOT INCLUDE THIS
-- DO.not

local augroup = vim.api.nvim_create_augroup
local BarmanjiGroup = augroup('Barmanji', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

function R(name)
    require("plenary.reload").reload_module(name)
end

vim.filetype.add({
    extension = {
        templ = 'templ',
    }
})

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

autocmd({ "BufWritePre" }, {
    group = BarmanjiGroup,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

autocmd('LspAttach', {
    group = BarmanjiGroup,
    callback = function(e)
        local opts = { buffer = e.buf }
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "gD", function() vim.lsp.buf.peek_definition() end, opts) -- Opens in a floating window if supported
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)

        -- For defination borders --
        vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
            border = "rounded", -- Options: "single", "double", "rounded", "solid", "shadow"
        })
        vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
            border = "rounded",
        })
        vim.lsp.handlers["textDocument/definition"] = vim.lsp.with(vim.lsp.handlers.definition, {
            border = "rounded",
        })
        vim.lsp.handlers["textDocument/declaration"] = vim.lsp.with(vim.lsp.handlers.declaration, {
            border = "rounded",
        })
    end
})
-- Highlight the group
-- vim.api.nvim_create_autocmd('LspAttach', {
--     callback = function(event)
--         local client = vim.lsp.get_client_by_id(event.data.client_id)
--         if not client then return end
--
--         -- Document Highlight
--         if client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
--             local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
--
--             vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
--                 buffer = event.buf,
--                 group = highlight_augroup,
--                 callback = function()
--                     vim.lsp.buf.document_highlight()
--                 end,
--             })
--
--             vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
--                 buffer = event.buf,
--                 group = highlight_augroup,
--                 callback = function()
--                     vim.lsp.buf.clear_references()
--                 end,
--             })
--         end
--
--         -- Inlay Hints Toggle
--         -- if client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
--         --   vim.keymap.set('n', '<leader>th', function()
--         --     vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
--         --   end, { desc = '[T]oggle Inlay [H]ints' })
--         -- end
--     end,
-- })
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
ColorMyPencils()
