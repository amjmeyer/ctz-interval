#import "../src/lib.typ": *
#set page(width: 16cm, height: auto, margin: 1cm)

= The four bracket types

#rpz-interval(
  xmin: -4, xmax: 5,
  values: (-2, 3),
  ctz-interval(
    -2, 3, type: "CC",
  ),
)

#rpz-interval(
  xmin: -4, xmax: 5,
  values: (-2, 3),
  ctz-interval(
    -2, 3, type: "CO",
  ),
)

#rpz-interval(
  xmin: -4, xmax: 5,
  values: (-2, 3),
  ctz-interval(
    -2, 3, type: "OC",
  ),
)

#rpz-interval(
  xmin: -4, xmax: 5,
  values: (-2, 3),
  ctz-interval(
    -2, 3, type: "OO",
  ),
)
