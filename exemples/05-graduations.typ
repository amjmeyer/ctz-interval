#import "../src/lib.typ": *
#set page(width: 16cm, height: auto, margin: 1cm)

= Ticks

#rpz-interval(
  xmin: -5, xmax: 5,
  ticks: range(-5, 6),
  ctz-interval(
    -2, 3, type: "CO",
    show-values: true,
  ),
)

#rpz-interval(
  xmin: 0, xmax: 20,
  ticks: range(0, 21),
  major-ticks: range(0,5).map(k => k*5),
  values: (0, 5, 10, 15, 20),
  ctz-interval(
    7, 13, type: "OC",
    color: blue, decor: "fill", show-values: true,
  ),
)
