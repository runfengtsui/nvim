local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

return {
  -- Examples of Greek letter snippets, autotriggered for efficiency
  s({ trig=";m", snippetType="autosnippet"},
    { t("μ"), }
  ),
}

