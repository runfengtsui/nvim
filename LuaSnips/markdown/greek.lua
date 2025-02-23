local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

return {
  -- Examples of Greek letter snippets, autotriggered for efficiency
  s({ trig="@q", snippetType="autosnippet"},
    { t("\\theta"), }
  ),
  s({ trig="@w", snippetType="autosnippet"},
    { t("\\omega"), }
  ),
  s({ trig="@e", snippetType="autosnippet"},
    { t("\\epsilon"), }
  ),
  s({ trig="@ve", snippetType="autosnippet"},
    { t("\\varepsilon"), }
  ),
  s({ trig="@r", snippetType="autosnippet"},
    { t("\\rho"), }
  ),
  s({ trig="@t", snippetType="autosnippet"},
    { t("\\tau"), }
  ),
  s({ trig="@y", snippetType="autosnippet"},
    { t("\\psi"), }
  ),
  s({ trig="@p", snippetType="autosnippet"},
    { t("\\pi"), }
  ),

  s({ trig="@a", snippetType="autosnippet"},
    { t("\\alpha"), }
  ),
  s({ trig="@s", snippetType="autosnippet"},
    { t("\\sigma"), }
  ),
  s({ trig="@S", snippetType="autosnippet"},
    { t("\\Sigma"), }
  ),
  s({ trig="@d", snippetType="autosnippet"},
    { t("\\delta"), }
  ),
  s({ trig="@D", snippetType="autosnippet"},
    { t("\\Delta"), }
  ),
  s({ trig="@f", snippetType="autosnippet"},
    { t("\\phi"), }
  ),
  s({ trig="@g", snippetType="autosnippet"},
    { t("\\gamma"), }
  ),
  s({ trig="@h", snippetType="autosnippet"},
    { t("\\eta"), }
  ),
  s({ trig="@j", snippetType="autosnippet"},
    { t("\\varphi"), }
  ),
  s({ trig="@l", snippetType="autosnippet"},
    { t("\\lambda"), }
  ),

  s({ trig="@z", snippetType="autosnippet"},
    { t("\\zeta"), }
  ),
  s({ trig="@x", snippetType="autosnippet"},
    { t("\\xi"), }
  ),
  s({ trig="@b", snippetType="autosnippet"},
    { t("\\beta"), }
  ),
  s({ trig="@n", snippetType="autosnippet"},
    { t("\\nu"), }
  ),
  s({ trig="@m", snippetType="autosnippet"},
    { t("\\mu"), }
  ),
}

