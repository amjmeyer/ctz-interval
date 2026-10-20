#import "../src/lib.typ": *
#set page(width: 16cm, height: auto, margin: 1cm)

= The examples from ProfLycee's documentation (§13, p. 55–58)

#rpz-interval(
  xmin: -8, xmax: 20,
  ctz-interval(
    "*", 13,
  ),
)

#rpz-interval(
  xmin: -2, xmax: 8,
  unit: 1cm,
  ticks: range(-2, 9),
  major-ticks: (0, 5),
)

#rpz-interval(
  xmin: -100, xmax: 200,
  width: 10, text-style: (size: 7pt), thickness: 0.6pt,
  ticks: range(-100, 201, step: 10),
  major-ticks: range(-100, 201, step: 50),
  values: range(-100, 201, step: 50),
  ctz-interval(
    -15, 175,
    show-values: true,
  ),
  ctz-interval(
    -56, 25,
    color: teal, decor: "fill",
    show-values: true,
  ),
  ctz-interval(
    0, 79, type: "OO",
    color: purple, decor: "zigzag", level: 1.5,
    show-values: true,
  ),
)

#rpz-interval(
  xmin: -8, xmax: 8,
  ticks: range(-8, 9),
  ctz-interval(
    -2, 5,
    decor: "fill",
    show-values: true, pos-values: "below",
  ),
  ctz-interval(
    -7, -1, type: "OO",
    color: blue, decor: "zigzag",
    show-values: true, pos-values: "below",
  ),
  ctz-interval(
    "*", 6, type: "CO",
    color: orange, decor: "hatch", level: 1.25,
    show-values: true,
  ),
)

#rpz-interval(
  xmin: -8, xmax: 8,
  ticks: range(-8, 9),
  ctz-interval(
    -2, 5,
    decor: "fill",
    show-values: true, pos-values: "below",
    label-inf: $a$, label-sup: $b$,
  ),
  ctz-interval(
    -calc.sqrt(5), 2 / 3, type: "OO",
    color: blue, decor: "fill",
    show-values: true,
    label-inf: $-sqrt(5)$, label-sup: $2/3$,
  ),
)
