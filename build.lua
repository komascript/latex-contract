#!/usr/bin/env texlua

--[[
  Build script for LaTeX package contract.
  Copyright (c) 2023-2024 Markus Kohm

  This file is part of the build system of contract.
]]

release_info = "2024-02-07 v0.91"
-- Bundle and modules

module       = "contract"

unpackfiles  = { "contract.dtx" }

installfiles = { "contract.sty" }

typesetfiles = {
--}
--
--docfiles     = {
   "contract-example-en.tex",
   "contract.dtx",
   "contract-example-de.tex",
--   "contract-example-en.pdf",
--   "contract-example-de.pdf",
--   "contract.pdf"
}

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
  description = [[The package is a KOMA-Script spin-off replacing the KOMA-Script package scrjura. It provides environments for contracts, laws, acts or other legal puposes. It features support for automatic numbering of paragraphs, and semi-automatic numbering of sentences.

Support is offered for both German and English texts.]],
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
   tagyear = string.sub (tagdate, 1, 4 )
   
   oldyear = string.match (content, "Copyright %(c%) (%d%d%d%d) Markus Kohm")
   if not oldyear then
      oldyear = string.match (content, "Copyright © (%d%d%d%d) Markus Kohm")
   end
      
   if oldyear and oldyear < tagyear then
      content = string.gsub (content,
			     "(Copyright %(c%) %d%d%d%d) Markus Kohm",
			     "%1-" .. tagyear .. " Markus Kohm")
      content = string.gsub (content,
			     "(Copyright © %d%d%d%d) Markus Kohm",
			     "%1-" .. tagyear .. " Markus Kohm")
   else
     content = string.gsub (content,
			    "(Copyright %(c%) %d%d%d%d%-)%d%d%d%d Markus Kohm",
			    "%1" .. tagyear .. " Markus Kohm")
     content = string.gsub (content,
			    "(Copyright © %d%d%d%d%-)%d%d%d%d Markus Kohm",
			    "%1" .. tagyear .. " Markus Kohm")
     content = string.gsub (content,
			    "(Copyright %(c%) %d%d%d%d–)%d%d%d%d Markus Kohm",
			    "%1" .. tagyear .. " Markus Kohm")
     content = string.gsub (content,
			    "(Copyright © %d%d%d%d–)%d%d%d%d Markus Kohm",
			    "%1" .. tagyear .. " Markus Kohm")
   end
   
   if string.match (file, "%.dtx$") then
      content = string.gsub (content,
                             "\n%s*%d%d%d%d%-%d%d%-%d%d v[%d%.]*%d+",
                             "\n  " .. tagdate .. " v" .. tagname )
   elseif string.match (file, "%.md$") then
      content = string.gsub (content,
                             "\nRelease: %d%d%d%d%-%d%d%-%d%d v[%d%.]*%d+\n",
                             "\nRelease: " .. tagdate .. " v" .. tagname .. "\n")
   elseif string.match (file, "%.lua$") then
      content = string.gsub (content,
                             '\nrelease_info%s*=%s*"%d%d%d%d%-%d%d%-%d%d%s*v[%d%.]*%d+"%s*\n',
                             '\nrelease_info = "' .. tagdate .. " v" .. tagname .. '"\n')
   end
   return content
end
