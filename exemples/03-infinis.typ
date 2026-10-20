#import "../src/lib.typ": *
#set page(width: 16cm, height: auto, margin: 1cm)

= Infinite bounds

#rpz-interval(
  xmin: -5, xmax: 4,
  ticks: range(-5, 5),
  values: (1,),
  ctz-interval(
    "*", 1, type: "OC",
    color: blue, decor: "fill",
  ),
)

#rpz-interval(
  xmin: -5, xmax: 4,
  ticks: range(-5, 5),
  values: (-2,),
  ctz-interval(
    -2, "*", type: "CO",
    color: blue, decor: "fill",
  ),
)

#rpz-interval(
  xmin: -5, xmax: 4,
  ticks: range(-5, 5),
  values: (0,),
  ctz-interval(
    "*", "*", type: "OO",
    color: blue, decor: "fill",
  ),
)

#rpz-interval(
  xmin: -10, xmax: 10,
  ticks: range(-10, 11),
  values: (0,),
  width: 12,
  ctz-interval(
    "*", 0, type: "OO",
    color: gray, decor: "hatch/135",
  ),
)
