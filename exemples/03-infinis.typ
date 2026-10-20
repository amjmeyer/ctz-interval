#import "../src/lib.typ": *
#set page(width: 16cm, height: auto, margin: 1cm)

= Bornes infinies

#rep-intervalles(
  xmin: -5, xmax: 4,
  graduations: range(-5, 5),
  valeurs: (1,),
  ctz-intervalle(
    "*", 1, type: "OF",
    couleur: blue, decor: "fond",
  ),
)

#rep-intervalles(
  xmin: -5, xmax: 4,
  graduations: range(-5, 5),
  valeurs: (-2,),
  ctz-intervalle(
    -2, "*", type: "FO",
    couleur: blue, decor: "fond",
  ),
)

#rep-intervalles(
  xmin: -5, xmax: 4,
  graduations: range(-5, 5),
  valeurs: (0,),
  ctz-intervalle(
    "*", "*", type: "OO",
    couleur: blue, decor: "fond",
  ),
)

#rep-intervalles(
  xmin: -10, xmax: 10,
  graduations: range(-10, 11),
  valeurs: (0,),
  longueur: 12,
  ctz-intervalle(
    "*", 0, type: "OO",
    couleur: gray, decor: "hach/135",
  ),
)
