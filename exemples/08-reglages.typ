#import "../src/lib.typ": *
#set page(width: 16cm, height: auto, margin: 1cm)

= Réglages de l'axe

#rep-intervalles(
  xmin: -2, xmax: 4,
  unite: 1cm,
  graduations: range(-2, 5),
  valeurs: range(-2, 5),
  ctz-intervalle(
    0, 3, type: "FO",
  ),
)

#rep-intervalles(
  xmin: -2, xmax: 4,
  longueur: 6,
  graduations: range(-2, 5),
  valeurs: range(-2, 5),
  ctz-intervalle(
    0, 3, type: "FO",
  ),
)

#rep-intervalles(
  xmin: -2, xmax: 4,
  hauteur: 24pt, haut-grad: 12pt, ep-trait: 0.5pt,
  graduations: range(-2, 5),
  valeurs: range(-2, 5),
  ctz-intervalle(
    0, 3, type: "FO",
    decor: "fond",
  ),
)

#rep-intervalles(
  xmin: -2, xmax: 4,
  police: (size: 7pt),
  graduations: range(-2, 5),
  valeurs: range(-2, 5),
  ctz-intervalle(
    0, 3, type: "FO",
  ),
)
