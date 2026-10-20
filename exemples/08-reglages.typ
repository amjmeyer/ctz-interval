#import "../src/lib.typ": *
#set page(width: 16cm, height: auto, margin: 1cm)

= Axis settings

#rpz-interval(
  xmin: -2, xmax: 4,
  unit: 1cm,
  ticks: range(-2, 5),
  values: range(-2, 5),
  ctz-interval(
    0, 3, type: "CO",
  ),
)

#rpz-interval(
  xmin: -2, xmax: 4,
  width: 6,
  ticks: range(-2, 5),
  values: range(-2, 5),
  ctz-interval(
    0, 3, type: "CO",
  ),
)

#rpz-interval(
  xmin: -2, xmax: 4,
  height: 24pt, tick-height: 12pt, thickness: 0.5pt,
  ticks: range(-2, 5),
  values: range(-2, 5),
  ctz-interval(
    0, 3, type: "CO",
    decor: "fill",
  ),
)

#rpz-interval(
  xmin: -2, xmax: 4,
  text-style: (size: 7pt),
  ticks: range(-2, 5),
  values: range(-2, 5),
  ctz-interval(
    0, 3, type: "CO",
  ),
)
