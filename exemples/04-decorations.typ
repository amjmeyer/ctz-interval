#import "../src/lib.typ": *
#set page(width: 16cm, height: auto, margin: 1cm)

= Decorations

#rpz-interval(
  xmin: -1, xmax: 6,
  values: (1, 4),
  ctz-interval(
    1, 4,
    color: teal, decor: "fill",
  ),
)

#rpz-interval(
  xmin: -1, xmax: 6,
  values: (1, 4),
  ctz-interval(
    1, 4,
    color: purple, decor: "zigzag",
  ),
)

#rpz-interval(
  xmin: -1, xmax: 6,
  values: (1, 4),
  ctz-interval(
    1, 4,
    color: orange, decor: "hatch",
  ),
)

#rpz-interval(
  xmin: -1, xmax: 11,
  values: (0, 3, 4, 7, 8, 10),
  ctz-interval(
    0, 3,
    color: orange, decor: "hatch/30",
  ),
  ctz-interval(
    4, 7,
    color: orange, decor: "hatch/90",
  ),
  ctz-interval(
    8, 10,
    color: orange, decor: "hatch/150",
  ),
)
