#import "../src/lib.typ": *
#set page(width: 16cm, height: auto, margin: 1cm)

= Plusieurs intervalles

#rep-intervalles(
  xmin: -4, xmax: 5,
  graduations: range(-4, 6),
  valeurs: (-1, 2),
  ctz-intervalle(
    "*", -1, type: "OF",
    couleur: blue, decor: "hach",
  ),
  ctz-intervalle(
    2, "*", type: "FO",
    couleur: blue, decor: "hach",
  ),
)

#rep-intervalles(
  xmin: -5, xmax: 5,
  graduations: range(-5, 6),
  valeurs: range(-5, 6),
  ctz-intervalle(
    -3, 2, type: "OF",
    couleur: blue, decor: "hach/60",
    aff-valeurs: true,
  ),
  ctz-intervalle(
    0, 4, type: "FO",
    couleur: red, niveau-v: 1.25, decor: "hach/120",
  ),
  ctz-intervalle(
    -1, 1, type: "OF",
    couleur: green, decor: "fond",
  ),
)

#rep-intervalles(
  xmin: -6, xmax: 6,
  graduations: range(-6, 7),
  valeurs: (-4, -1, 2, 5),
  ctz-intervalle(
    -4, 2,
    couleur: red, decor: "fond",
  ),
  ctz-intervalle(
    -1, 5, type: "OO",
    couleur: blue, decor: "fond",
  ),
)
