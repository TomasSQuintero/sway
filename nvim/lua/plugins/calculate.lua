vim.pack.add({
  { src = "https://github.com/vzze/calculator.nvim" },
}, { load = true })

vim.api.nvim_create_user_command("Calculate", "lua require(\"calculator\").calculate()",
    { ["range"] = 1, ["nargs"] = 0 })

-- usage
-- visual mode to select numbers
-- Calculate in command mode to calculate
