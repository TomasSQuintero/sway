vim.pack.add({
	{ src = "https://github.com/mikavilpas/yazi.nvim" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
})

-- event = "VeryLazy"
local map = vim.keymap.set

-- map({ "n", "v" }, "<leader>cf", "<cmd>Yazi<cr>", {desc = "Open yazi at the current file"})
-- map( 'n',"<leader>cw", "<cmd>Yazi cwd<cr>", { desc = "Open the file manager in nvim's working directory"})
-- map( 'n', "<c-up>", "<cmd>Yazi toggle<cr>", { desc = "Resume the last yazi session"})

require("yazi").setup({
  opts = {
    open_for_directories = false,
  },
  init = function()
    vim.g.loaded_netrwPlugin = 1
  end,
})
----------------------------------------------------------------------------------------------------
