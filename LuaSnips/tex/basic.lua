local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s({ trig="\\section" }, {
    t("\\section{"), i(1), t("}"),
  }),
  s({ trig="\\subsection" }, {
    t("\\subsection{"), i(1), t("}"),
  }),
  s({ trig="\\subsubsection" }, {
    t("\\subsubsection{"), i(1), t("}"),
  }),
  s({ trig="\\usepackage" }, {
    t("\\usepackage{"), i(1), t("}"),
  }),
  s({ trig="\\ref" }, {
    t("\\ref{"), i(1), t("}"),
  }),
  s({ trig="\\cite" }, {
    t("\\cite{"), i(1), t("}"),
  }),
  s({ trig="\\eqref" }, {
    t("\\eqref{"), i(1), t("}"),
  }),
  s({ trig="\\input" }, {
    t("\\input{"), i(1), t("}"),
  }),

  s({ trig="incode" }, {
    t("\\verb|"), i(1), t("|"),
  }),
}

