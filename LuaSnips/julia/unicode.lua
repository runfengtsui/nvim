local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

return {
  -- Examples of Greek letter snippets, autotriggered for efficiency
  s({ trig = "\\mu", name = "μ", dscr = "the greek μ" },
    { t("μ"), }
  ),
  s({ trig = "\\pi", name = "π", dscr = "the greek π" },
    { t("π"), }
  ),

  -- mathematical sign
  s({ trig = "\\times", name = "×", dscr = "the multiplication sign" },
    { t("×"), }
  ),
  s({ trig = "\\div", name = "÷", dscr = "the division sign" },
    { t("÷"), }
  ),
  s({ trig = "\\approx", name = "≈", dscr = "the approximate sign" },
    { t("≈"), }
  ),
  s({ trig = "\\neq", name = "≠", dscr = "the not equal sign" },
    { t("≠"), }
  ),

  s({ trig = "\\partial", name = "∂", dscr = "the partial differential operator" },
    { t("∂"), }
  ),
  s({ trig = "\\nabla", name = "∇", dscr = "the gradient operator" },
    { t("∇"), }
  ),
  s({ trig = "\\circ", name = "∘", dscr = "the composite operator" },
    { t("∘"), }
  ),
}

