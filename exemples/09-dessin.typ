#import "../src/lib.typ": *
#import "@preview/cetz:0.5.2"
#set page(width: 16cm, height: auto, margin: 1cm)

= In your own canvas: `rpz-interval-draw`

#cetz.canvas(length: 1cm, {
  rpz-interval-draw(
    xmin: -3, xmax: 5,
    ticks: range(-3, 6),
    values: (-1, 3),
    ctz-interval(
      -1, 3, type: "CO",
      color: blue, decor: "fill",
    ),
  )
  cetz.draw.content((6.5, 0.6), text(blue)[$x in [-1 ; 3[$])
})
