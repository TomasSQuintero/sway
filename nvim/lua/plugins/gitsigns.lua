vim.pack.add({
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
})

require("gitsigns").setup({
    signs = {
      add          = { text = '│' },
      change       = { text = '│' },
      delete       = { text = '_' },
      topdelete    = { text = '‾' },
      changedelete = { text = '~' },
      untracked    = { text = '┆' },
    },
    signcolumn = true,  -- toggle with `:gitsigns toggle_signs`
    numhl      = false, -- toggle with `:gitsigns toggle_numhl`
    linehl     = false, -- toggle with `:gitsigns toggle_linehl`
    word_diff  = false, -- toggle with `:gitsigns toggle_word_diff`
    watch_gitdir = {
      follow_files = true
    },
    auto_attach = true,
    attach_to_untracked = false,
    current_line_blame = false, -- toggle with `:gitsigns toggle_current_line_blame`
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
      delay = 1000,
      ignore_whitespace = false,
      virt_text_priority = 100,
    },
    current_line_blame_formatter = '<author>, <author_time:%y-%m-%d> - <summary>',
    sign_priority = 6,
    update_debounce = 100,
    status_formatter = nil, -- use default
    max_file_length = 40000, -- disable if file is longer than this (in lines)
    preview_config = {
      -- options passed to nvim_open_win
      border = 'single',
      style = 'minimal',
      relative = 'cursor',
      row = 0,
      col = 1
    },
    on_attach = function(bufnr)
      local gitsigns = require('gitsigns')

      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      -- navigation
      map('n', ']c', function()
        if vim.wo.diff then
          vim.cmd.normal({']c', bang = true})
        else
          gitsigns.nav_hunk('next')
        end
      end, {desc = 'next hunk'})

      map('n', '[c', function()
        if vim.wo.diff then
          vim.cmd.normal({'[c', bang = true})
        else
          gitsigns.nav_hunk('prev')
        end
      end, {desc = 'previous hunk'})

      -- actions
      map('n', '<leader>hs', gitsigns.stage_hunk, {desc = 'stage hunk'})
      map('n', '<leader>hr', gitsigns.reset_hunk, {desc = 'reset hunk'})
      map('v', '<leader>hs', function() gitsigns.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end, {desc = 'stage hunk'})
      map('v', '<leader>hr', function() gitsigns.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end, {desc = 'reset hunk'})
      map('n', '<leader>hs', gitsigns.stage_buffer, {desc = 'stage buffer'})
      map('n', '<leader>hu', gitsigns.undo_stage_hunk, {desc = 'undo stage hunk'})
      map('n', '<leader>hr', gitsigns.reset_buffer, {desc = 'reset buffer'})
      map('n', '<leader>hp', gitsigns.preview_hunk, {desc = 'preview hunk'})
      map('n', '<leader>hb', function() gitsigns.blame_line{full=true} end, {desc = 'blame line'})
      map('n', '<leader>tb', gitsigns.toggle_current_line_blame, {desc = 'toggle blame'})
      map('n', '<leader>hd', gitsigns.diffthis, {desc = 'diff this'})
      map('n', '<leader>hd', function() gitsigns.diffthis('~') end, {desc = 'diff this ~'})
      map('n', '<leader>td', gitsigns.toggle_deleted, {desc = 'toggle deleted'})

      -- text object
      map({'o', 'x'}, 'ih', ':<c-u>gitsigns select_hunk<cr>', {desc = 'select hunk'})
    end
})
