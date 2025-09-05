-- lua/Barmanji/lazy/fold-collapse.lua
-- zA, zr, zm
return {
  {
    'kevinhwang91/nvim-ufo',
    dependencies = { 'kevinhwang91/promise-async' },
    event = { 'BufReadPre', 'BufNewFile' },
    init = function()
      -- Set foldcolumn to show fold indicators
      vim.o.foldcolumn = '1'
      vim.o.foldlevel = 99
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true

      -- Configure fillchars to hide unwanted characters and show only arrows
      vim.opt.fillchars = {
        foldopen = '',   -- down arrow for open folds
        foldclose = '',  -- right arrow for closed folds
        foldsep = ' ',    -- remove the vertical separator
        fold = ' ',       -- remove the fold fill character
      }

      -- Set foldtext to empty to remove numbers in foldcolumn
      vim.opt.foldtext = ' '

      -- fold open/close shortcuts (safe wrappers)
      vim.keymap.set('n', 'zR', function()
        local ok, ufo = pcall(require, 'ufo')
        if ok and ufo.openAllFolds then
          ufo.openAllFolds()
        end
      end)

      vim.keymap.set('n', 'zM', function()
        local ok, ufo = pcall(require, 'ufo')
        if ok and ufo.closeAllFolds then
          ufo.closeAllFolds()
        end
      end)

      -- custom peek mapping
      vim.keymap.set('n', '<leader>K', function()
        local ok, ufo = pcall(require, 'ufo')
        if ok and ufo.peekFoldedLinesUnderCursor then
          local winid = ufo.peekFoldedLinesUnderCursor()
          if winid then
            return
          end
        end
        -- fallback: try CoC, then LSP hover
        if vim.fn.exists ':CocActionAsync' == 2 then
          pcall(vim.fn.CocActionAsync, 'definitionHover')
        end
        if vim.lsp and vim.lsp.buf and vim.lsp.buf.hover then
          pcall(vim.lsp.buf.hover)
        end
      end, { desc = 'UFO peek folded (fallback to hover)' })
    end,

    config = function()
      local ok, ufo = pcall(require, 'ufo')
      if not ok or type(ufo.setup) ~= 'function' then
        return
      end

      -- Custom fold text handler to show line count with icon
      local handler = function(virtText, lnum, endLnum, width, truncate)
        local newVirtText = {}
        local suffix = (' 󰁂 %d '):format(endLnum - lnum)
        local sufWidth = vim.fn.strdisplaywidth(suffix)
        local targetWidth = width - sufWidth
        local curWidth = 0

        for _, chunk in ipairs(virtText) do
          local chunkText = chunk[1]
          local chunkWidth = vim.fn.strdisplaywidth(chunkText)
          if targetWidth > curWidth + chunkWidth then
            table.insert(newVirtText, chunk)
          else
            chunkText = truncate(chunkText, targetWidth - curWidth)
            local hlGroup = chunk[2]
            table.insert(newVirtText, { chunkText, hlGroup })
            chunkWidth = vim.fn.strdisplaywidth(chunkText)
            -- str width returned from truncate() may less than 2nd argument, need padding
            if curWidth + chunkWidth < targetWidth then
              suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
            end
            break
          end
          curWidth = curWidth + chunkWidth
        end

        table.insert(newVirtText, { suffix, 'MoreMsg' })
        return newVirtText
      end

      ufo.setup {
        provider_selector = function(_, _, _)
          return { 'treesitter', 'indent' }
        end,
        fold_virt_text_handler = handler,
      }
    end,
  },
}
