local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmta = require("luasnip.extras.fmt").fmta
local sn = ls.snippet_node
local c = ls.choice_node

return {
  -- math environment
  s({ trig="mk", name="inline math", dscr="Insert inline Math Environment.", snippetType="autosnippet" },
    { t("\\("), i(1), t("\\)")
  }),

  -- delimiters
  s({ trig = "\\lp", snippetType = "autosnippet" }, {
    t("\\left("), i(1), t("\\right)")
  }),
  s({ trig = "\\lv", snippetType = "autosnippet" }, {
    t("\\left\\lvert"), i(1), t("\\right\\rvert "),
  }),
  s({ trig = "\\lV", snippetType = "autosnippet" }, {
    t("\\left\\lVert"), i(1), t("\\right\\rVert"),
  }),
  s({ trig = "\\lb", snippetType = "autosnippet" }, {
    t("\\left\\lbrace"), i(1), t("\\right\\rbrace"),
  }),

  -- bold symbol
  s({ trig = "\\bs", snippetType = "autosnippet" }, fmta([[
    \boldsymbol{<>}
  ]], { i(1) })),

  s({ trig = "\\ff", dscr = "Expands `ff` into `frac{}{}` or `dfrac{}{}", snippetType = "autosnippet" },{
    c(1, {
      sn(1, fmta([[
        \frac{<>}{<>}
      ]], { i(1), i(2) })),
      sn(2, fmta([[
        \dfrac{<>}{<>}
      ]], { i(1), i(2) }))
    })
  }),

  s({ trig = "\\sq", dscr = "The squared(cubed, etc.) root of value.", snippetType = "autosnippet"}, {
    c(1, {
      sn(1, { t("\\sqrt{"), i(1), t("}") }),
      sn(2, { t("\\sqrt["), i(2), t("]{"), i(1), t("}") }),
    })
  }),

  -- derivative and partial derivative
  s({ trig = "\\dd", dscr = "The derivative of function.", snippetType = "autosnippet" }, {
    c(1, {
      sn(1, fmta([[
        \frac{\mathrm{d} <>}{\mathrm{d} <>}
      ]], { i(1), i(2) })),
      sn(2, fmta([[
        \dfrac{\mathrm{d} <>}{\mathrm{d} <>}
      ]], { i(1), i(2) })),
    })
  }),
  s({ trig = "\\pd", dscr = "The partial derivative of function with serival variables.", snippetType = "autosnippet" }, {
    c(1, {
      sn(1, fmta([[
        \frac{\partial <>}{\partial <>}
      ]], { i(1), i(2) })),
      sn(2, fmta([[
        \dfrac{\partial <>}{\partial <>}
      ]], { i(1), i(2) })),
    })
  }),

  -- sum
  s({ trig = "\\sum", snippetType="autosnippet" }, {
    c(1, {
      sn(1, fmta([[
        \sum_{<>}^{<>} <>
      ]], { i(1), i(2), i(3) })),
      sn(2, fmta([[
        \sum\limits_{<>}^{<>} <>
      ]], { i(1), i(2), i(3) })),
      sn(3, fmta([[
        \displaystyle\sum_{<>}^{<>} <>
      ]], { i(1), i(2), i(3) })),
    })
  }),

  -- limit
  s({ trig = "\\lim", snippetType = "autosnippet" }, {
    c(1, {
      sn(1, fmta([[
        \lim_{<>} <>
      ]], { i(1), i(2) })),
      sn(2, fmta([[
        \lim\limits_{<>} <>
      ]], { i(1), i(2) })),
    })
  }),

  -- integral
  s({ trig = "\\int", snippetType = "autosnippet" }, {
    c(1, {
      sn(1, fmta([[
        \int <> \,\mathrm{d}<>
      ]], { i(1), i(2) })),
      sn(2, fmta([[
        \int_{<>}^{<>} <> \,\mathrm{d}<>
      ]], { i(1), i(2), i(3), i(4) })),
      sn(3, fmta([[
        \displaystyle\int <> \,\mathrm{d}<>
      ]], { i(1), i(2) })),
      sn(4, fmta([[
        \displaystyle\int_{<>}^{<>} <> \,\mathrm{d}<>
      ]], { i(1), i(2), i(3), i(4) }))
    })
  }),

  s("vector", {
    t{"\\begin{pmatrix}", ""},
    i(1), t{" \\\\ "}, i(2), t{"", ""},
    t{"\\end{pmatrix}"}, i(0)
  }),
  s("pmatrix", {
    t{"\\begin{pmatrix}", ""},
    i(1), t{" & "}, i(2), t{" & "}, i(3), t{" \\\\", ""},
    i(4), t{" & "}, i(5), t{" & "}, i(6), t{" \\\\", ""},
    i(7), t{" & "}, i(8), t{" & "}, i(9), t{"", ""},
    t{"\\end{pmatrix}"}, i(0)
  }),
}

