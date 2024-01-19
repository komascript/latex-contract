#!/usr/bin/env texlua

--[[
  Build script for LaTeX package contract.
  Copyright (c) 2023 Markus Kohm

  This file is part of the build system of contract.
]]

release_info = "2023-10-10 v0.0.1"
-- Bundle and modules

module       = "contract"

unpackfiles  = { "contract.dtx" }

installfiles = { "contract.sty" }

typesetfiles = { "contract-example-en.tex",
		 "contract.dtx",
		 "contract-example-de.tex" }

-- Package

packtdszip   = false

-- CTAN information

ctanpkg   = "contract"

uploadconfig = {
  pkg         = "contract",
  version     = release_info,
  author      = "Markus Kohm",
  license     = "lppl1.3c",
  summary     = "environments for contracts, laws, acts or other legal pupose",
  topic       = "legal",
  ctanPath    = "/macros/latex/contrib/contract",
  bugtracker  = "https://github.com/komascript/latex-contract/issues",
  home        = "https://github.com/komascript/latex-contract",
  repository  = "https://github.com/komascript/latex-contract.git",
}

-- Typesetting

typesetruns  = 5

-- Detail how to set the version automatically
-- Example: `l3build tag --date 2023-10-10 v0.0.1'

tagfiles = {"*.dtx","README.md","build.lua"}

function update_tag (file,content,tagname,tagdate)
   tagname = string.gsub (tagname, "v(%d+%.%d+)", "%1")
   
   if string.match (file, "%.dtx$") then
      return string.gsub (content,
                          "%[%d%d%d%d%-%d%d%-%d%d v[%d%.]*%d+",
                          "[" .. tagdate .. " v" .. tagname )
   elseif string.match (file, "%.md$") then
      return string.gsub (content,
                          "\nRelease: %d%d%d%d%-%d%d%-%d%d v[%d%.]*%d+  \n",
                          "\nRelease: " .. tagdate .. " v" .. tagname .. "  \n")
   elseif string.match (file, "%.lua$") then
      return string.gsub (content,
                          '\nrelease_info%s*=%s*"%d%d%d%d%-%d%d%-%d%d%s*v[%d%.]*%d+"%s*\n',
                          '\nrelease_info = "' .. tagdate .. " v" .. tagname .. '"\n')
   end
   return content
end
