#import "../src/lib.typ": *
#set page(width: 16cm, height: auto, margin: 1cm)

= The simplest: no ticks

#rpz-interval(
  xmin: 0, xmax: 6,
  values: (3,),
  ctz-interval(
    3, "*", type: "CO",
  ),
)

#rpz-interval(
  xmin: -3, xmax: 6,
  values: (-1, 4),
  ctz-interval(
    -1, 4,
  ),
)

#rpz-interval(
  xmin: -3, xmax: 5,
  ctz-interval(
    "*", 2, type: "OO",
    show-values: true,
  ),
)

#rpz-interval(
  xmin: -2, xmax: 7,
  ctz-interval(
    0, 5, type: "OC",
    show-values: true, pos-values: "below",
  ),
)
