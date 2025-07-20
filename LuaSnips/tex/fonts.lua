local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmta = require("luasnip.extras.fmt").fmta

return {
  s({ trig="\\texttt", dscr="Italic fonts." }, {
      t("\\texttt{"), i(1), t("}"),
  }),
  s({ trig="\\textbf", dscr="Bold fonts." }, {
      t("\\textbf{"), i(1), t("}"),
  }),

  s({ trig="\\mathbb", dscr="Blackboard bold font in math." }, {
      t("\\mathbb{"), i(1), t("}"),
  }),
  s({ trig="\\mathrm", dscr="Roman font in math." }, {
      t("\\mathrm{"), i(1), t("}"),
  }),
  s({ trig="\\mathcal", dscr="Calligraphy font in math." }, {
      t("\\mathcal{"), i(1), t("}"),
  }),
}

