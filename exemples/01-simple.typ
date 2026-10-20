#import "../src/lib.typ": *
#set page(width: 16cm, height: auto, margin: 1cm)

= Le plus simple : pas de graduation

#rep-intervalles(
  xmin: 0, xmax: 6,
  valeurs: (3,),
  ctz-intervalle(
    3, "*", type: "FO",
  ),
)

#rep-intervalles(
  xmin: -3, xmax: 6,
  valeurs: (-1, 4),
  ctz-intervalle(
    -1, 4,
  ),
)

#rep-intervalles(
  xmin: -3, xmax: 5,
  ctz-intervalle(
    "*", 2, type: "OO",
    aff-valeurs: true,
  ),
)

#rep-intervalles(
  xmin: -2, xmax: 7,
  ctz-intervalle(
    0, 5, type: "OF",
    aff-valeurs: true, pos-valeurs: "below",
  ),
)
