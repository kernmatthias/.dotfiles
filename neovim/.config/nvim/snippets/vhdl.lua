local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node
local f = ls.function_node
local d = ls.dynamic_node
local rep = require("luasnip.extras").rep
local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("vhdl", {
	s("sul", { t("std_ulogic") }),
	s("sulv", { t("std_ulogic_vector") }),
	s("i2sulv", { t("std_ulogic_vector(to_unsigned("), i(1, "num"), t(", "), i(2, "len"), t("))") }),
	s("sulv2i", { t("to_integer(unsigned("), i(1, "sulv"), t("))") }),
	s("hexi", { t("16#"), i(1, "0"), t("#") }),
})
