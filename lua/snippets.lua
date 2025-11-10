local M = {}

local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local fmt = require("luasnip.extras.fmt").fmt

M.setup = function()
  -- Load all snippet files
  require("snippets.all")
  require("snippets.javascript")
  require("snippets.typescript")
  require("snippets.python")
  require("snippets.lua")
  require("snippets.html")
  require("snippets.css")
  require("snippets.cpp")
  -- Add more languages as needed
end

return M
