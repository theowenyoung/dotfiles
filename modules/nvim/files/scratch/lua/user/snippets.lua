local ls = require("luasnip")
local parse_snippet = ls.parser.parse_snippet

local js = {
    parse_snippet({trig = "cl"}, [[
    console.log("$1", $1);
    ]],{})
}


ls.add_snippets("typescript",js)
ls.add_snippets("javascript",js)
