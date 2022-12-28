local ls = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt
local c = ls.choice_node
local i = ls.insert_node
local s = ls.snippet
local t = ls.text_node

return {
  s(
    { trig = "gr", desc = "Insert a git repo." },
    fmt(
      [[
        https://<>/<>/<>
      ]],
      {
        c(1, {
          t("github.com"),
          t("gitlab.com"),
          t("codeberg.com"),
          t("st.ht"),
        }),
        i(2, "user"),
        i(0, "repo"),
      },
      { delimiters = "<>" }
    )
  ),
}
