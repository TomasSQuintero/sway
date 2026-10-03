vim.api.nvim_create_autocmd('PackChanged', { callback = function(ev)
  local name, kind = ev.data.spec.name, ev.data.kind
  if name == 'nvim-treesitter' and kind == 'update' then
    if not ev.data.active then vim.cmd.packadd('nvim-treesitter') end
    vim.cmd('TSUpdate')
  end
end })

vim.pack.add({
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter',
    data = { on_update = function() vim.cmd('TSUpdate') end, },
  },
})

require("nvim-treesitter").setup ({
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "python" },
  auto_install = true,
  ignore_install = { "javascript" },
  highlight = {
      enable = true,
      disable = function(lang, buf)
          local max_filesize = 100 * 1024 -- 100 KB
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > max_filesize then
              return true
          end
      end,
      -- maybe set the next one true/false, depending on issues
      additional_vim_regex_highlighting = { "python" },
  },
})

-- -- branch = 'master',
-- -- lazy = false,
-- -- build = ":TSUpdate",
--
-- vim.api.nvim_create_autocmd('FileType', {
-- 	pattern = {'markdown', 'lua', 'rust', 'c', 'cpp', 'python', },
-- 	callback = function() vim.treesitter.start() end,
-- })

