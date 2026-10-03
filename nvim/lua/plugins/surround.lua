-- 1. seleccionar palabra
-- 2. sa + )]} o cualquier otro simbolo (pero tiene que ser el de cierre, sino deja un espacio)

vim.pack.add({
  { src = "https://github.com/echasnovski/mini.surround" },
})

require("mini.surround").setup({
  highlight_duration = 500,
  mappings = {
    add = 'sa',
    delete = 'sd',
    find = 'sf',
    find_left = 'sF',
    highlight = 'sh',
    replace = 'sr',
    suffix_last = 'l',
    suffix_next = 'n',
  },
  n_lines = 20,
  respect_selection_type = false,
  search_method = 'cover',
  silent = false,
})
