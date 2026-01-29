local ls = require("luasnip")
local s = ls.add_snippet
local sn = ls.snippet_node
local t = ls.textnode
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

ls.add_snippets("tex", {
	s("bit", { t("\\begin{itemize}", "    \\item "), i(0), t("", "\\end{itemize}") }),
	s("ftt", { t("\\texttt{"), i(1), t("}"), i(0) }),
})
