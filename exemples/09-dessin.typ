#import "../src/lib.typ": *
#import "@preview/cetz:0.5.2"
#set page(width: 16cm, height: auto, margin: 1cm)

= Dans son propre canvas : `rep-intervalles-dessin`

#cetz.canvas(length: 1cm, {
  rep-intervalles-dessin(
    xmin: -3, xmax: 5,
    graduations: range(-3, 6),
    valeurs: (-1, 3),
    ctz-intervalle(
      -1, 3, type: "FO",
      couleur: blue, decor: "fond",
    ),
  )
  cetz.draw.content((6.5, 0.6), text(blue)[$x in [-1 ; 3[$])
})
