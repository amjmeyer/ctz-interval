#import "../src/lib.typ": *
#set page(width: 16cm, height: auto, margin: 1cm)

= Several intervals

#rpz-interval(
  xmin: -4, xmax: 5,
  ticks: range(-4, 6),
  values: (-1, 2),
  ctz-interval(
    "*", -1, type: "OC",
    color: blue, decor: "hatch",
  ),
  ctz-interval(
    2, "*", type: "CO",
    color: blue, decor: "hatch",
  ),
)

#rpz-interval(
  xmin: -5, xmax: 5,
  ticks: range(-5, 6),
  values: range(-5, 6),
  ctz-interval(
    -3, 2, type: "OC",
    color: blue, decor: "hatch/60",
    show-values: true,
  ),
  ctz-interval(
    0, 4, type: "CO",
    color: red, level: 1.25, decor: "hatch/120",
  ),
  ctz-interval(
    -1, 1, type: "OC",
    color: green, decor: "fill",
  ),
)

#rpz-interval(
  xmin: -6, xmax: 6,
  ticks: range(-6, 7),
  values: (-4, -1, 2, 5),
  ctz-interval(
    -4, 2,
    color: red, decor: "fill",
  ),
  ctz-interval(
    -1, 5, type: "OO",
    color: blue, decor: "fill",
  ),
)
