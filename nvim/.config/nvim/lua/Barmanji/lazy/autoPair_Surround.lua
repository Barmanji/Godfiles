return {
  {
    'windwp/nvim-autopairs',
    event = { 'InsertEnter' },
    dependencies = {
      'hrsh7th/nvim-cmp',
    },
    config = function()
      local autopairs = require 'nvim-autopairs' -- import nvim-autopairs

      -- setup autopairs
      autopairs.setup {
        check_ts = true, -- treesitter enabled
        ts_config = {
          lua = { 'string' }, -- dont add pairs in lua string treesitter nodes
          javascript = { 'template_string' }, -- dont add pairs in javscript template_string treesitter nodes
          java = false, -- dont check treesitter on java
        },
      }
      -- import nvim-autopairs completion functionality
      local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
      -- import nvim-cmp plugin (completions plugin)
      local cmp = require 'cmp'
      -- make autopairs and completion work together
      cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
    end,
  },

  -- NOTE: js,ts,jsx,tsx Auto Close Tags
  {
    'windwp/nvim-ts-autotag',
    ft = { 'html', 'xml', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact' },
    config = function()
      -- Independent nvim-ts-autotag setup
      require('nvim-ts-autotag').setup {
        opts = {
          enable_close = true, -- Auto-close tags
          enable_rename = true, -- Auto-rename pairs
          enable_close_on_slash = false, -- Disable auto-close on trailing `</`
        },
        per_filetype = {
          ['html'] = {
            enable_close = true, -- Disable auto-closing for HTML
          },
          ['typescriptreact'] = {
            enable_close = true, -- Explicitly enable auto-closing (optional, defaults to `true`)
          },
        },
      }
    end,
  },
  -- NOTE: Surround
  {
    'echasnovski/mini.surround',
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {
      -- Add custom surroundings to be used on top of builtin ones. For more
      -- information with examples, see `:h MiniSurround.config`.
      custom_surroundings = nil,

      -- Duration (in ms) of highlight when calling `MiniSurround.highlight()`
      highlight_duration = 300,

      -- Module mappings. Use `''` (empty string) to disable one.
      -- INFO:
      -- saiw surround with no whitespace
      -- saw surround with whitespace
      mappings = {
        add = 'sa', -- Add surrounding in Normal and Visual modes
        delete = 'ds', -- Delete surrounding
        find = 'sf', -- Find surrounding (to the right)
        find_left = 'sF', -- Find surrounding (to the left)
        highlight = 'sh', -- Highlight surrounding
        replace = 'sr', -- Replace surrounding
        update_n_lines = 'sn', -- Update `n_lines`

        suffix_last = 'l', -- Suffix to search with "prev" method
        suffix_next = 'n', -- Suffix to search with "next" method
      },

      -- Number of lines within which surrounding is searched
      n_lines = 20,

      -- Whether to respect selection type:
      -- - Place surroundings on separate lines in linewise mode.
      -- - Place surroundings on each line in blockwise mode.
      respect_selection_type = false,

      -- How to search for surrounding (first inside current line, then inside
      -- neighborhood). One of 'cover', 'cover_or_next', 'cover_or_prev',
      -- 'cover_or_nearest', 'next', 'prev', 'nearest'. For more details,
      -- see `:h MiniSurround.config`.
      search_method = 'cover',

      -- Whether to disable showing non-error feedback
      silent = false,
    },
  },
}
