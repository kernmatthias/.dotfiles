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
	s(
		"record",
		{ t("type "), i(1, "<name>"), t({ " is record", "" }), i(0), t({ "", "end record " }), rep(1), t(";") }
	),
	-- s("regs", { i(1, "regs"), t(" : process("), i(2, "i_clk"), t({ " is", "begin", "end process " }), rep(1), t(";") }),
	s("regs", {
		-- Process Label
		i(1, "regs"),
		t(" : process"),

		-- The Choice Node to switch between types
		c(2, {
			-- Choice 1: Asynchronous Reset
			sn(
				nil,
				fmt(
					[[
({clk}, {rst}) is
begin
    if {rst_rep} = not '1' then
        {reset_logic}
    elsif rising_edge({clk_rep}) then
        {logic}
    end if;
]],
					{
						clk = i(1, "i_clk"),
						rst = i(2, "i_reset_async_n"),
						rst_rep = rep(2),
						reset_logic = i(3, "r <= c_init_r;"),
						clk_rep = rep(1),
						logic = i(4, "r <= nxr;"),
					}
				)
			),

			-- Choice 2: Synchronous Reset
			sn(
				nil,
				fmt(
					[[
({clk}) is
begin
    if rising_edge({clk_rep}) then
        if {rst} = not '1' then
            {reset_logic}
        else
            {logic}
        end if;
    end if;
]],
					{
						clk = i(1, "i_clk"),
						clk_rep = rep(1),
						rst = i(2, "i_reset_n"),
						reset_logic = i(3, "r <= c_init_r;"),
						logic = i(4, "r <= nxr;"),
					}
				)
			),
		}),
		t({ "", "end process " }),
		rep(1),
		t(";"),
	}),
	s("comb", {
		i(1, "comb"),
		t(" : process ("),
		i(2, "r"),
		t({ ") is", "begin", "    ", "    " }),
		i(3, "nxr"),
		t(" <= "),
		rep(2),
		t({ ";", "    ", "    " }),
		i(0),
		t({ "", "    ", "end process " }),
		rep(1),
		t({ ";", "" }),
	}),
	-- 	s("comb", {
	-- 		fmt(
	-- 			[[
	-- {p_name} : process ({regs}, {sens}) is
	-- begin
	--
	--     {nxr} <= {regs_rep};
	--
	--     {statements}
	--
	-- end process {name_rep};
	--
	-- ]],
	-- 			{
	-- 				p_name = i(1, "comb"),
	-- 				regs = i(2, "r"),
	-- 				sens = i(3, "i_"),
	-- 				nxr = i(4, "nxr"),
	-- 				regs_rep = rep(2),
	-- 				statements = i(0),
	-- 				name_rep = rep(1),
	-- 			}
	-- 		),
	-- 	}),
})
