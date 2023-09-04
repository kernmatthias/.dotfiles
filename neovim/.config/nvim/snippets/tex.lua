local ls = require('luasnip')
local s = ls.add_snippet
local sn = ls.snippet_node
local t = ls.textnode
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require('luasnip.extras.fmt').fmt
local fmta = require('luasnip.extras.fmt').fmta
local rep = require('luasnip.extras').rep

ls.add_snippet = {
	s(
		{
			trig = "bit",
			dscr = "begin itemization",
		},
		fmt(
			[[
                    \begin{itemize}
                    \item {}
                    \end{itemize}
                ]],
			{ i(1) }
		)
	)
}
