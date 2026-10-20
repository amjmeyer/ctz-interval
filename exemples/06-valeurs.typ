#import "../src/lib.typ": *
#set page(width: 16cm, height: auto, margin: 1cm)

= Values

#rpz-interval(
  xmin: -5, xmax: 5,
  ticks: range(-5, 6),
  values: range(-5, 6),
  ctz-interval(
    -2, 3, type: "CO",
  ),
)

#rpz-interval(
  xmin: 0, xmax: 3,
  ticks: range(0, 7).map(k => k / 2),
  values: range(0, 7).map(k => k / 2),
  ctz-interval(
    0.5, 2.5, type: "CO",
  ),
)

#rpz-interval(
  xmin: -3, xmax: 4,
  ticks: range(-3, 5), 
  values: range(-3,5),
  ctz-interval(
    -calc.sqrt(2), 10/3, type: "OO",
    color: blue, decor: "fill",
    show-values: true, label-inf: $sqrt(2)$, label-sup: $10/3$
  ),
)

#rpz-interval(
  xmin: 0, xmax: 10,
  ctz-interval(
    2, 7,
    decor: "fill", show-values: true, pos-values: "below",
    label-inf: $a$, label-sup: $b$,
  ),
)

#rpz-interval(
  xmin: -2, xmax: 3,
  ticks: range(-6, 10).map(k => k / 3),
  major-ticks: range(-2, 4),
  values: range(-2, 4),
  ctz-interval(
    -2/3, 5/3, type: "CO",
    color: blue, decor: "fill",
    show-values: true, 
  ),
)

#rpz-interval(
  xmin: -2, xmax: 3,
  ticks: range(-6, 10).map(k => k / 3),
  major-ticks: range(-2, 4),
  values: range(-2, 4),
  ctz-interval(
    -2/3, 5/3, type: "CO",
    color: blue, decor: "fill",
    show-values: true, label-inf: $-2/3$, label-sup: $5/3$,
  ),
)
