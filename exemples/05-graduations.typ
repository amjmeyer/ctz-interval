#import "../src/lib.typ": *
#set page(width: 16cm, height: auto, margin: 1cm)

= Graduations

#rep-intervalles(
  xmin: -5, xmax: 5,
  graduations: range(-5, 6),
  ctz-intervalle(
    -2, 3, type: "FO",
    aff-valeurs: true,
  ),
)

#rep-intervalles(
  xmin: 0, xmax: 20,
  graduations: range(0, 21),
  graduations-alt: range(0,5).map(k => k*5),
  valeurs: (0, 5, 10, 15, 20),
  ctz-intervalle(
    7, 13, type: "OF",
    couleur: blue, decor: "fond", aff-valeurs: true,
  ),
)
