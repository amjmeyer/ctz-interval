#import "../src/lib.typ": *
#set page(width: 16cm, height: auto, margin: 1cm)

= Décorations

#rep-intervalles(
  xmin: -1, xmax: 6,
  valeurs: (1, 4),
  ctz-intervalle(
    1, 4,
    couleur: teal, decor: "fond",
  ),
)

#rep-intervalles(
  xmin: -1, xmax: 6,
  valeurs: (1, 4),
  ctz-intervalle(
    1, 4,
    couleur: purple, decor: "zigzag",
  ),
)

#rep-intervalles(
  xmin: -1, xmax: 6,
  valeurs: (1, 4),
  ctz-intervalle(
    1, 4,
    couleur: orange, decor: "hach",
  ),
)

#rep-intervalles(
  xmin: -1, xmax: 11,
  valeurs: (0, 3, 4, 7, 8, 10),
  ctz-intervalle(
    0, 3,
    couleur: orange, decor: "hach/30",
  ),
  ctz-intervalle(
    4, 7,
    couleur: orange, decor: "hach/90",
  ),
  ctz-intervalle(
    8, 10,
    couleur: orange, decor: "hach/150",
  ),
)
