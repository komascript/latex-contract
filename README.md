# The LaTeX package `contract`

Copyright (c) 2007–2024 Markus Kohm

Release: 2024-01-24 v0.0.1

License: LPPL 1.3c

KOMA presents the KOMA-Script spin-off `contract`. Package `contract` provides
environments for legal contracts, sections, paragraphs and similar. It is the
official successor to the former KOMA-Script package `scrjura`.

----------------------------------------------------------------------------

This work may be distributed and/or modified under the conditions of
the LaTeX Project Public License, version 1.3c of the license.
The latest version of this license is in
    http://www.latex-project.org/lppl.txt
and version 1.3c or later is part of all distributions of LaTeX
version 2005/12/01 or later.

The Current Maintainer and author of this work is Markus Kohm.

This work consists of the files listed in MANIFEST.md.

----------------------------------------------------------------------------

# Abstract

For several years
[KOMA-Script](https://www.sourceforge.net/project/koma-script) provides
package `scrjura`. The package was developed at the request of and in
co-operation with a German lawyer. In 2024, the package was separated from
KOMA-Script and has since been called `contract`. The new name was chosen to
avoid confusion with KOMA-Script packages. Secondly, it better reflects the
purpose of the package.

# Installation for Users

If you are a user, you should wait until all the package has been added to
your preferred TeX distribution. Then you can use the package manager of your
TeX distribution to install the packages.

# Unpacking for Distributors

Distributors should download [the distribution from
CTAN](https://www.ctan.org/pkg/contract). See `MANIFEST.md` for information
about the files, that build the distribution.

If distributors also want to distribute `contract.sty`, they can
unpack it using

    tex contract.dtx
	
Note, that you have to use `tex` not `latex`, `pdflatex`, `xelatex` or
`lualatex`!

**Important Note:** The user manual of `contract` uses some Ppackages, which
are still under development and therefore currently may not be available on
CTAN. So it is recommended to use the existing `contract.pdf`, which is also
part of [the CTAN distribution](https://www.ctan.org/pkg/contract). As an
alternative you may use the file available at the corresponding [github
release of `contract`](https://github.com/komascript/latex-contract/releases).

# Unpacking and Installation for Developers

Developers who want the current developer version of the code to be installed
for testing, should clone [the `latex-contract`
repository](https://github.com/komascript/latex-contract), e.g.,
using

	git clone https://github.com/komascript/latex-contract.git

You can than unpack and install `contract` using:

	l3build install
	
from within the main directory of the cloned respository.

**Important Note:** The user manual of `contract` uses some packages, which
are still under development and therefore currently may not be available on
CTAN. So you usually cannot use `l3build doc` to generate the documentation or
`l3build install --full` to install `contract` with the documentation. Instead
you either have to read `contract.dtx` or use the `contract.pdf` available at
part of the newest [`contract`
release](https://github.com/komascript/latex-contract/releases). You can copy
such a PDF to the `doc/latex/contract/` folder of any TEXMF tree.

# How to get the Manual

After installation `contract` and the user manual you can use:

    texdoc contract
	
Without installation you can get `contract.pdf` as part of the corresponding
[`contract`
release](https://github.com/komascript/latex-contract/releases).

# How to Contribute

To become a contributor, e.g., do heavy testing. If you find an issue, please
[report it](#how-to-report-issues). You can also become a developer and, e.g.,
make new test files to the packages. See the
[`l3build`](https://ctan.org/pkg/l3build) manual for more information about
tests. If you've created a new test and think that it would be useful, please
either do a pull request or [add a new issue](#how-to-report-issues) and
include your test file.


# How to Report Issues

If you think you have found a bug (or another kind of issue) using
`contract` you should use [the issue
tracker](https://github.com/komascript/latex-contract/issues). Please
first search for similar issues already reported and maybe also already fixed
and closed. Maybe the replies to such a similar report would help you too.

If your issue is new, you should report it also using [the issue
tracker](https://github.com/komascript/latex-contract/issues). Please be kind,
not only when writing the report but also when reading replies and commenting
or answering. And please always add a minimal working example and usually the
relevant parts of the `log`-file to your report. Please use the [markdown for
code](https://docs.github.com/en/get-started/writing-on-github/working-with-advanced-formatting/creating-and-highlighting-code-blocks)
to add such files into the text of your report. The correct language
identifier for LaTeX code would be `latex`. For `log`-files you won't need any
language identifier. Usually you should not use attachments for code or
`log`-files unless you've been asked to do so. And please note, reports should
always be self-containing. External links often break and so the report become
useles.

# How to Say Thank You for my Work

Hey, I'm doing this as a hobby. So no need to say thank you. But I'm a vain
fop, so I'm certainly up for a quick thank you by email. On komascript.de you
can find an [explanation of my wishes](https://komascript.de/wunschliste) if
you want to give more. If you don't understand German, just click to links at
that page.

# Milestones

The development has just begun. Currently [the first
milestone](https://github.com/komascript/latex-contract/milestone/1):

 - [x] creating a new repository
 - [x] copying `scrjura.dtx` from KOMA-Script as `contract.dtx` to the new
       repository
 - [x] creating a new build environment:
   - [x] `README.md`
   - [x] `LICENSE.md`
   - [x] `MANIFEST.md`
   - [x] `build.lua`
   - [x] test files
 - [x] renaming several internals of `contract`
 - [x] adding user documentation based on the `scrjura` chapters of the English
       KOMA-Script manual
 - [x] improving user documentation

almost has been reached.

Further milestones could be:

 - [ ] replacing `scrjura` by a `contract` wrapper in KOMA-Script for
       compatibility only
 - [ ] reimplementing several internals of `contract`:
   - [ ] replacing KOMA-Script options by LaTeX key-value options
   - [ ] replacing \newkomafont, \setkomafont by something not KOMA-Script
         related or alterntively internally uses `scrkbase` by `scrextend`,
   - [ ] using `expl3`, 
   - [ ] using the new paragraph hooks of LaTeX,
   - [ ] using the extended referencing mechanism of LaTeX.

# From `scrjura` to `contract`

If you have been using the `scrjura` package and are now switching to the
`contract` package, you should read chapter “From `scrjura` to `contract`” in
the `contract` user manual. The most important and incompatible change IMHO
is, that the argument of `\Clause` and `\SubClause` isn't mandaroty any longer
but optional. So the syntax has changed to `\Clause[<options>]`
resp. `\SubClause[<options>]`.
