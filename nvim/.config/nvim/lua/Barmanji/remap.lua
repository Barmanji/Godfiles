vim.g.mapleader = ' '
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex) Now doing with Oil

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

vim.keymap.set('n', 'J', 'mzJ`z')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- They work by default
-- vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
-- vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
-- vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
-- vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
vim.keymap.set('n', '<leader>zig', '<cmd>LspRestart<cr>')

-- greatest remap ever
vim.keymap.set('x', '<leader>p', [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]]) -- copied to system clip
vim.keymap.set('n', '<leader>Y', [["+Y]])

vim.keymap.set({ 'n', 'v' }, '<leader>d', [["_d]])

vim.keymap.set('n', '<leader>ss', function()
  vim.cmd 'so'
end)

-- This is going to get me cancelled
vim.keymap.set('i', '<C-c>', '<Esc>')

-- vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set('n', '<C-f>', '<cmd>silent !tmux neww ~/scripts/tmux-sessionizer<CR>') -- TODO Gotta work on this

--these 4 below cmds are fucking my normal window tab manuvering so i commented em!
--Quickfix my ass
vim.keymap.set('n', '<C-k>', '<cmd>cnext<CR>zz')
vim.keymap.set('n', '<C-j>', '<cmd>cprev<CR>zz')
vim.keymap.set('n', '<leader>k', '<cmd>lnext<CR>zz')
vim.keymap.set('n', '<leader>j', '<cmd>lprev<CR>zz')

vim.keymap.set('n', '<leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set('n', '<leader>cx', '<cmd>!chmod +x %<CR>', { silent = true })

vim.keymap.set('n', '<leader>F', vim.lsp.buf.format)
vim.keymap.set('n', '<leader>mr', '<cmd>CellularAutomaton make_it_rain<CR>')
vim.keymap.set('n', '<leader>ms', '<cmd>CellularAutomaton scramble<CR>')

--split management - DONT USE EM
-- vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
-- -- split window vertically
-- vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
-- -- split window horizontally
-- vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
-- -- close current split window
vim.keymap.set('n', '<leader>x', '<cmd>close<CR>', { desc = 'Close current split' })

-- Copy filepath to the clipboard
vim.keymap.set('n', '<leader>fp', function()
  local filePath = vim.fn.expand '%:~' -- Gets the file path relative to the home directory
  vim.fn.setreg('+', filePath) -- Copy the file path to the clipboard register
  print('File path copied to clipboard: ' .. filePath) -- Optional: print message to confirm
end, { desc = 'Copy file path to clipboard' })

-- Toggle LSP diagnostics visibility
local isLspDiagnosticsVisible = true
vim.keymap.set('n', '<leader>lx', function()
  isLspDiagnosticsVisible = not isLspDiagnosticsVisible
  vim.diagnostic.config {
    virtual_text = isLspDiagnosticsVisible,
    underline = isLspDiagnosticsVisible,
  }
end, { desc = 'Toggle LSP diagnostics' })

vim.keymap.set('n', '<leader>ce', function()
  vim.cmd 'Copilot enable'
  print 'Copilot enabled'
end, { desc = 'Enabled Copilot' })

vim.keymap.set('n', '<leader>cd', function()
  vim.cmd 'Copilot disable'
  print 'Copilot disabled'
end, { desc = 'Disabled Copilot' })
