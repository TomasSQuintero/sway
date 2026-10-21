local c = {
	bg     = "#181616",
	bg1    = "#282727",
	bg2    = "#393836",
	fg     = "#c5c9c5",
	dim    = "#625e5a",
	blue   = "#8ba4b0",
	green  = "#87a987",
	pink   = "#a292a3",
	red    = "#c4746e",
	yellow = "#c4b28a",
}

local function mode(color)
	return {
		a = { bg = color, fg = c.bg, gui = "bold" },
		b = { bg = c.bg2, fg = color },
		c = { bg = c.bg1, fg = c.fg },
	}
end

return {
	normal   = mode(c.blue),
	insert   = mode(c.green),
	visual   = mode(c.pink),
	replace  = mode(c.red),
	command  = mode(c.yellow),
	inactive = {
		a = { bg = c.bg, fg = c.dim },
		b = { bg = c.bg, fg = c.dim },
		c = { bg = c.bg, fg = c.dim },
	},
}
