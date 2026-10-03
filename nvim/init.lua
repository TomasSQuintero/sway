require("keybinds")
require("plugins")

vim.cmd("syntax on")
vim.opt.termguicolors = true

-- line numbers
vim.opt.number = true
-- vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.cursorcolumn = false

-- tabs and indentation
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.linebreak = true

vim.opt.softtabstop = 4
vim.opt.numberwidth = 1
vim.opt.signcolumn = "number"
vim.opt.foldcolumn = "0"
vim.opt.cmdheight = 0

-- search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = true

-- clipboard
vim.opt.clipboard = "unnamedplus"
vim.g.clipboard = {
    name = "wl-clipboard",
    copy = {
        ["+"] = "wl-copy --foreground --type text/plain",
        ["*"] = "wl-copy --foreground --primary --type text/plain",
    },
    paste = {
        ["+"] = function()
            return vim.fn.systemlist("wl-paste --no-newline", {""}, 1)
        end,
        ["*"] = function()
            return vim.fn.systemlist("wl-paste --primary --no-newline", {""}, 1)
        end,
    },
    cache_enabled = true,
}

-- others
vim.opt.undofile = true
vim.opt.winborder = "rounded"
vim.opt.wrap = false
vim.opt.title = true
vim.opt.titlestring = "%F"
vim.opt.fillchars:append({ eob = " " })
vim.opt.showmode = false
vim.opt.showcmd = true
vim.opt.inccommand = "split"
vim.opt.mousescroll = "ver:3,hor:0"

-- vim.cmd([[set mouse=]])
-- vim.cmd([[set noswapfile]])
vim.cmd([[hi @lsp.type.number gui=italic]])

-- corremos :PackUpdate para actualizar los plugins
-- aparece un buffer con los cambios a instalar
-- confirmamos con :w/:write
-- para borrar un plugin, sobre el titulo, en el buffer luego de hacer
-- pack update, hacemos gra, y sale un prompt para borrarlo
vim.api.nvim_create_user_command('PackUpdate', function()
  vim.pack.update()
end, {})

vim.cmd"packadd nvim.undotree"

vim.cmd('autocmd FileType python setlocal formatoptions+=ro')

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking text",
  callback = function()
    vim.hl.on_yank()
  end,
})

-- vim.opt.showtabline = 2
