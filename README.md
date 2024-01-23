# The LaTeX package `contract`

A KOMA-Script spin-off providing contract environments. 
This is the official successor to the former KOMA-Script package `scrjura`.

# Milestones

The development has just begun …

- [x] creating a new repository
- [x] copying `scrjura.dtx` from KOMA-Script as `contract.dtx` to the new
      repository
- [ ] creating a new build environment:
  - [ ] `README.md`
  - [x] `LICENSE.md`
  - [x] `MANIFEST.md`
  - [x] `build.lua`
  - [x] test files
- [x] renaming several internals of `contract`
- [x] adding user documentation based on the `scrjura` chapters of the English
      KOMA-Script manual
- [x] improving user documentation
- [ ] [creating the first
      release](https://github.com/komascript/latex-contract/milestone/1)
- [ ] removing `scrjura` from KOMA-Script
- [ ] reimplementing several internals of `contract`:
  - [ ] replacing KOMA-Script options by LaTeX key-value options
  - [ ] replacing \newkomafont, \setkomafont by something not KOMA-Script
        related,
  - [ ] using `expl3`, 
  - [ ] using the new paragraph hooks of LaTeX,
  - [ ] using the extended referencing mechanism of LaTeX.
- [ ] [creating a new release of the new
      package](https://github.com/komascript/latex-contract/milestone/2)

