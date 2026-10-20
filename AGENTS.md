# ctz-interval — guide for coding agents

Typst package that draws intervals on a number line, after `RepIntervalles`
(§13) of Cédric Pierquet's LaTeX package ProfLycee. Built on CeTZ. Public
names, keys, error messages and README are in English; comments and internal
names (prefixed with `_`, or local variables) are in French.

## Layout

```
src/
  lib.typ           entry point: exports only rpz-interval,
                    rpz-interval-draw and ctz-interval
  deps.typ          the only external import (@preview/cetz:0.5.2)
  outils.typ        _nombre, _infini, _est-nombre (not exported)
  rpz-interval.typ  everything else
exemples/           01-… to 09-…: one file per use case; doc-proflycee.typ
  readme.sh         rebuilds the "Examples" part of the README
images/             README SVGs, produced by exemples/readme.sh
tests/lancer.sh     runs all the tests
```

## How it works

Two steps.

1. **`ctz-interval(inf, sup, keys)` draws nothing.** It checks its arguments
   (`panic` with a clear message otherwise) and returns a dictionary, a
   "record": `(objet: "intervalle", inf: …, sup: …, color: …, …)`. An
   infinite bound (`"*"` or `none`) becomes `none`, and `decor: "hatch/60"`
   becomes `decor: "hatch"` + `angle: 60deg`.
2. **`rpz-interval-draw(keys, ..records)` draws** the axis, ticks, values,
   then the intervals. It rejects unknown keys and anything that is not an
   `objet: "intervalle"` record. `rpz-interval` wraps it in
   `cetz.canvas(length: 1cm, …)`.

Why two steps: only `rpz-interval` knows the axis scale, and it draws in
**two passes** (all decorations, then all lines) so that a fill never hides
the bracket of another interval.

Drawing details (`rpz-interval-draw`):

- Scale: `u = width / (xmax - xmin)` cm per unit if `unit: auto`, else
  `unit / 1cm`; `X(x) = x * u`. CeTZ coordinates are in cm.
- The axis extends 5 % of its length on each side (room for the arrow and
  infinite bounds). An infinite sup bound stops 0.2 before the arrow.
- An interval is centred at height `level * height`; its brackets and
  decoration band span `±height/2` around it. Closed bracket `C` faces
  inwards, open bracket `O` outwards.
- `values` are written below the lower of: major ticks (`0.8 * tick-height`)
  or brackets (`height / 2`).
- Hatching: lines tilted by `angle`, clipped to the interval by
  `_dans-bande` (tested on its own).
- Bound label: `label-inf`/`label-sup` if given, else `_nombre(bound)`
  (rounded to 4 decimals, decimal comma).

## Conventions

- Public names and keys in English kebab-case; internal names start with `_`
  (not exported by `lib.typ`).
- 3-line MIT header in every `.typ` of `src/`. Short comments.
- Independent rewrite: never copy ProfLycee's code (LPPL).
- A new key or case: add it to `exemples/` and to the README key tables,
  with a test if possible.

## Tests

`tests/lancer.sh` (or `tests/lancer.sh <name prefix>` to filter) compiles,
producing no file:

- `exemples/*.typ`: must compile without error (warnings are reported but
  do not fail);
- the ```` ```typ ```` blocks of the README;
- `tests/unitaires/*.typ`: assertions (`aide.typ` provides `egal`, `texte`,
  `releve-textes`);
- `tests/erreurs/*.typ`: must fail with the message given on the first line
  (`// attendu : …`).

Exit code = number of failures. After changing an example or the rendering,
run `exemples/readme.sh`: it compiles the drawings of `01-…` to `07-…` and
`doc-proflycee.typ` to SVG and rewrites the README between the
`<!-- exemples … -->` and `<!-- fin des exemples -->` markers (do not edit
that part by hand). A drawing = a block starting with `#rpz-interval(` and
ending with `)` alone on its line.

## Known pitfalls

- The `type` parameter of `ctz-interval` shadows the `type()` function in
  its body: test types in `outils.typ` (`_est-nombre`). For the same reason
  no key is named `length` or `text`.
- Bounds are Typst numbers (`0`, `2 / 3`, `calc.sqrt(5)`), never strings
  (`"0"`) nor content (`$sqrt(5)$`); only `"*"` is accepted as a string
  (infinite bound).
- `text-style` is passed to `text(..text-style, fill: …)`: putting `fill`
  in it raises an error (duplicate argument).
- In math mode, a hyphenated name (`ctz-interval`) reads as a subtraction:
  call it with `#`.
