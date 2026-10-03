vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- save, quit and force quit
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Write file" })
vim.keymap.set({'n', 'v'}, "<leader>q", ":wq!<CR>", { desc = "Write and quit" })
vim.keymap.set("n", "<leader>x", ":q!<CR>", { desc = "Force quit" })

-- launch Oil.nvim
vim.keymap.set("n", "<leader>-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- leader a to add ; to the end of the line, keep cursor in place
vim.keymap.set('n', '<leader>a', 'm`A;<Esc>``', { noremap = true, silent = true })

vim.keymap.set('x', '<leader>a', function()
  local start_line = vim.fn.line("'<")
  local end_line = vim.fn.line("'>")

  for line = start_line, end_line do
    local current = vim.fn.getline(line)
    vim.fn.setline(line, current .. ';')
  end
end, { noremap = true, silent = true })

-- yazi
vim.keymap.set('n', '<leader>y', ':Yazi<CR>', { noremap = true, silent = true })

-- Sorting
vim.keymap.set('v', '<leader>s', ":'<,'>sort<CR>", { noremap = true, silent = true })
vim.keymap.set('v', '<leader>S', ":'<,'>sort!<CR>", { noremap = true, silent = true })
vim.keymap.set('v', '<leader>m', ":'<,'>!shuf<CR>", { noremap = true, silent = true })

-- word wrap toggle
vim.keymap.set('n', '<leader>z', ':set wrap!<CR>', { noremap = true, silent = true })

-- search and replace
vim.keymap.set("n", "<leader>r", ":%s//g<Left><Left>", { desc = "Global search and replace", silent = false })
vim.keymap.set("v", "<leader>r", ":s/\\%V/g<Left><Left>", { desc = "Search and replace in selection", silent = false })

-- markdown link formatting
vim.keymap.set('n', '<leader>k', 'i[]()2hi', { noremap = true, silent = true })
vim.keymap.set('i', '<C-k>', '[]()2hi', { noremap = true, silent = true })

-- yank link inside ()
vim.keymap.set('n', 'yl', ':norm $hyi(0<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'yL', 'yi(', { noremap = true, silent = true })

-- Control + a para seleccionar todo el archivo
vim.keymap.set('n', 'va', 'ggVG', { noremap = true, silent = true })

-- leader d to insert the date, already formatted
vim.keymap.set('n', '<leader>d', "i<C-R>= strftime('%Y-%m-%d')<CR> ", { noremap = true, silent = true })

-- paste over selected text without losing what you yanked
vim.keymap.set('x', 'p', [["_dP]], { noremap = true, silent = true })

-- delete without yanking
vim.keymap.set('x', '<leader>d', [["_d]], { noremap = true, silent = true })

-- move lines with J and K
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

-- indent while keeping selection
vim.keymap.set('v', '<', "<gv", { noremap = true, silent = true })
vim.keymap.set('v', '>', ">gv", { noremap = true, silent = true })

-- clear keybinds with ctrl h
vim.keymap.set({ "n", "v" }, "<C-h>", "<cmd>nohlsearch<CR>", { silent = true, desc = "Clear search highlight" })

-- toggle status bar
vim.keymap.set('n', 'zs', function()
  vim.o.laststatus = vim.o.laststatus == 0 and 3 or 0
end, { desc = 'Toggle statusline' })

-- zen mode
local zen_enabled = false

local function apply_zen()
  if zen_enabled then
    require('lualine').hide()
    vim.o.laststatus = 0
    vim.wo.number = false
    vim.wo.relativenumber = false
    vim.wo.signcolumn = 'no'
  else
    require('lualine').hide({ unhide = true })
    vim.o.laststatus = 3
    vim.wo.number = true
    vim.wo.relativenumber = true
    vim.wo.signcolumn = 'auto'
  end
end

vim.keymap.set('n', 'ze', function()
  zen_enabled = not zen_enabled
  apply_zen()
end, { desc = 'Toggle zen mode (statusline + gutter)' })

vim.api.nvim_create_autocmd('VimResized', {
  callback = function()
    if zen_enabled then
      apply_zen()
    end
  end,
})

-- toggle gutter (numbers + sign column) only
local gutter_enabled = true

vim.keymap.set('n', 'zn', function()
  gutter_enabled = not gutter_enabled
  vim.wo.number = gutter_enabled
  vim.wo.relativenumber = gutter_enabled
  vim.wo.signcolumn = gutter_enabled and 'auto' or 'no'
end, { desc = 'Toggle gutter (numbers + signcolumn)' })

vim.opt.scrolloff = 999

vim.keymap.set({ 'n', 'v' }, '<ScrollWheelDown>', '2j', { silent = true })
vim.keymap.set({ 'n', 'v' }, '<ScrollWheelUp>', '2k', { silent = true })
-- checkbox
local function toggle_checkbox_line(ln, force_add)
  local line = vim.fn.getline(ln)
  local indent, rest = line:match('^(%s*)(.*)$')
  local content = rest:match('^[-*] %[[ xX]%] (.*)$')

  if content then
    -- already has a checkbox -> strip it
    vim.fn.setline(ln, indent .. content)
  elseif force_add then
    -- no checkbox -> add one
    vim.fn.setline(ln, indent .. '- [ ] ' .. rest)
  end
end

local function toggle_checkboxes(start_line, end_line)
  -- decide add-vs-remove based on the FIRST line's state
  local first = vim.fn.getline(start_line)
  local _, rest = first:match('^(%s*)(.*)$')
  local has_checkbox = rest:match('^[-*] %[[ xX]%] ') ~= nil

  for ln = start_line, end_line do
    toggle_checkbox_line(ln, not has_checkbox)
  end
end

-- Normal mode: toggle current line
vim.keymap.set('n', '<leader>c', function()
  local ln = vim.fn.line('.')
  toggle_checkboxes(ln, ln)
end, { desc = 'Toggle markdown checkbox' })

-- Visual mode: toggle all selected lines
vim.keymap.set('v', '<leader>c', function()
  local s = vim.fn.line('v')
  local e = vim.fn.line('.')
  if s > e then s, e = e, s end
  toggle_checkboxes(s, e)
  vim.cmd('normal! \27') -- exit visual mode
end, { desc = 'Toggle markdown checkbox' })

-- bullet point
local function toggle_bullet_line(ln, force_add)
  local line = vim.fn.getline(ln)
  local indent, rest = line:match('^(%s*)(.*)$')
  local content = rest:match('^[-*] (.*)$')

  if content then
    -- already has a bullet -> strip it
    vim.fn.setline(ln, indent .. content)
  elseif force_add then
    -- no bullet -> add one
    vim.fn.setline(ln, indent .. '- ' .. rest)
  end
end

local function toggle_bullets(start_line, end_line)
  -- decide add-vs-remove based on the FIRST line's state
  local first = vim.fn.getline(start_line)
  local _, rest = first:match('^(%s*)(.*)$')
  local has_bullet = rest:match('^[-*] ') ~= nil

  for ln = start_line, end_line do
    toggle_bullet_line(ln, not has_bullet)
  end
end

-- Normal mode: toggle current line
vim.keymap.set('n', '<leader>b', function()
  local ln = vim.fn.line('.')
  toggle_bullets(ln, ln)
end, { desc = 'Toggle markdown bullet' })

-- Visual mode: toggle all selected lines
vim.keymap.set('v', '<leader>b', function()
  local s = vim.fn.line('v')
  local e = vim.fn.line('.')
  if s > e then s, e = e, s end
  toggle_bullets(s, e)
  vim.cmd('normal! \27') -- exit visual mode
end, { desc = 'Toggle markdown bullet' })
