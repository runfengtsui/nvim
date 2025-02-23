local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt
local f = ls.function_node

return {
  s({ trig = "information", dscr = "Create descriptive information about the file." }, fmt([[
    ---
    Title: {title}
    Author: {author}
    Date: {date1}
    Modified: {date2}
    ---
  ]], {
      title = f(function ()
          local filename = vim.api.nvim_buf_get_name(0)
          return string.match(filename, ".+/(.+)%.md")
        end, {}),
      author = i(1, "邱彼郑楠 (runfengtsui@yeah.net)"),
      date1 = f(function ()
        return os.date("%Y-%m-%d %H:%M:%S", os.time())
      end, {}),
      date2 = f(function ()
        return os.date("%Y-%m-%d %H:%M:%S", os.time())
      end, {}),
    })
  ),
  s({ trig = "cb", dscr = "The code block for programming languages." }, {
    t("```"), i(2, "language"), t({"", ""}),
    i(1, "Codes"),
    t({"", "```", ""}),
  }),
  s({ trig = "link", dscr = "The url link." }, {
    t("["), i(1), t("]("), i(2), t(")"),
  }),
}

