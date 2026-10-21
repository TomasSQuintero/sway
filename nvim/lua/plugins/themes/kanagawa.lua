vim.pack.add({
	{ src = "https://github.com/rebelot/kanagawa.nvim" },
})

require("kanagawa").setup({
	compile = false,
	undercurl = true,
	commentStyle = { italic = true },
	keywordStyle = { italic = true },
	statementStyle = { bold = true },
	transparent = false,
	dimInactive = false,
	terminalColors = true,
	colors = {
		theme = {
			all = {
				ui = {
					bg_gutter = "none", -- sin fondo distinto en la columna de números
				},
			},
		},
	},
	overrides = function()
		local o = {
			-- número de la línea actual: dragonOrange apagado en vez de roninYellow
			CursorLineNr = { fg = "#b6927b", bold = true },
			-- yank flash / incsearch: dragonOrange apagado con texto oscuro
			IncSearch = { fg = "#181616", bg = "#b6927b" },
			-- paréntesis/corchete que hace pareja con el del cursor
			MatchParen = { fg = "#b6927b", bold = true },

			-- menú de completado: grises dragon en vez del azul wave
			Pmenu         = { fg = "#c5c9c5", bg = "#282727" },
			PmenuSel      = { fg = "NONE", bg = "#393836", bold = true },
			PmenuKind     = { fg = "#c5c9c5", bg = "#282727" },
			PmenuKindSel  = { fg = "#c5c9c5", bg = "#393836", bold = true },
			PmenuExtra    = { fg = "#737c73", bg = "#282727" },
			PmenuExtraSel = { fg = "#a6a69c", bg = "#393836" },
			PmenuSbar     = { bg = "#282727" },
			PmenuThumb    = { bg = "#625e5a" },

			-- columna de tipo (Function, Text...) en nvim-cmp / blink.cmp
			CmpItemKind          = { fg = "#c5c9c5" },
			CmpItemMenu          = { fg = "#c5c9c5" },
			BlinkCmpKind         = { fg = "#c5c9c5" },
			BlinkCmpLabelDetail  = { fg = "#c5c9c5" },
			BlinkCmpLabelDescription = { fg = "#c5c9c5" },
		}

		-- los grupos por tipo (CmpItemKindFunction, BlinkCmpKindText...) también en blanco
		local kinds = {
			"Text", "Method", "Function", "Constructor", "Field", "Variable", "Class",
			"Interface", "Module", "Property", "Unit", "Value", "Enum", "Keyword",
			"Snippet", "Color", "File", "Reference", "Folder", "EnumMember",
			"Constant", "Struct", "Event", "Operator", "TypeParameter",
		}
		for _, k in ipairs(kinds) do
			o["CmpItemKind" .. k] = { fg = "#c5c9c5" }
			o["BlinkCmpKind" .. k] = { fg = "#c5c9c5" }
		end

		return o
	end,
	theme = "dragon",
	background = {
		dark = "dragon",
		light = "lotus",
	},
})

vim.cmd.colorscheme("kanagawa-dragon")
