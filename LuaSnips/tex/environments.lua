local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmta = require("luasnip.extras.fmt").fmta

return {
  s({ trig="env", dscr="LaTeX envoronments", snippetType="autosnippet" },
    fmta([[
      \begin{<>}
        <>
      \end{<>}
    ]],
      {
        i(1), i(2),
        rep(1),   -- this node repeats insert node i(1)
      })
  ),

  s({ trig = "enum", dscr = "enumerate environment" }, {
    t("\\begin{enumerate}"),
    t({"", "\t\\item "}), i(1),
    t({"", "\\end{enumerate}", ""})
  }),
  s({ trig = "items", dscr = "itemize environment" }, {
    t("\\begin{itemize}"),
    t({"", "\t\\item "}), i(1),
    t({"", "\\end{itemize}", ""})
  }),

  s({ trig = "eq", dscr = "equation environment with label" }, {
    t("\\begin{equation}"),
    t({"", "\t"}), i(1),
    t({"", "\t\\label{eq:"}), i(2), t("}"),
    t({"", "\\end{equation}", ""})
  }),
  s({ trig = "eq*", dscr = "equation environment without label" }, {
    t("\\begin{equation*}"),
    t({"", "\t"}), i(1),
    t({"", "\\end{equation*}", ""})
  }),

  s({ trig = "cases", dscr = "cases environment" }, {
    t({"\\begin{cases}", ""}), i(1), t({"", "\\end{cases}"})
  }),

  s({ trig = "def", dscr = "definition environment" }, {
    t({"\\begin{definition}", ""}), i(1), t({"", "\\end{definition}", ""})
  }),
  s({ trig = "theo", dscr = "theorem environment" }, {
    t({"\\begin{theorem}", ""}), i(1), t({"", "\\end{theorem}", ""})
  }),

  s({ trig="figure", dscr="insert figure", },
    fmta([[
      \begin{figure}[<>]
        \centering
        \includegraphics[<>]{<>}
        \caption{<>}
        \label{fig:<>}
      \end{figure}
    ]], {
      i(5, "htbp!");
      i(2, "width = 0.8\\textwidth");
      i(1, "path of figure");
      i(3, "Figure Caption");
      i(4, "label");
    })
  ),
}

