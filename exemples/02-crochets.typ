#import "../src/lib.typ": *
#set page(width: 16cm, height: auto, margin: 1cm)

= Les quatre types de crochets

#rep-intervalles(
  xmin: -4, xmax: 5,
  valeurs: (-2, 3),
  ctz-intervalle(
    -2, 3, type: "FF",
  ),
)

#rep-intervalles(
  xmin: -4, xmax: 5,
  valeurs: (-2, 3),
  ctz-intervalle(
    -2, 3, type: "FO",
  ),
)

#rep-intervalles(
  xmin: -4, xmax: 5,
  valeurs: (-2, 3),
  ctz-intervalle(
    -2, 3, type: "OF",
  ),
)

#rep-intervalles(
  xmin: -4, xmax: 5,
  valeurs: (-2, 3),
  ctz-intervalle(
    -2, 3, type: "OO",
  ),
)
