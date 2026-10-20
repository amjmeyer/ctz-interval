#import "../src/lib.typ": *
#set page(width: 16cm, height: auto, margin: 1cm)

= Les exemples de la doc de ProfLycee (§13, p. 55 à 58)

#rep-intervalles(
  xmin: -8, xmax: 20,
  ctz-intervalle(
    "*", 13,
  ),
)

#rep-intervalles(
  xmin: -2, xmax: 8,
  unite: 1cm,
  graduations: range(-2, 9),
  graduations-alt: (0, 5),
)

#rep-intervalles(
  xmin: -100, xmax: 200,
  longueur: 10, police: (size: 7pt), ep-trait: 0.6pt,
  graduations: range(-100, 201, step: 10),
  graduations-alt: range(-100, 201, step: 50),
  valeurs: range(-100, 201, step: 50),
  ctz-intervalle(
    -15, 175,
    aff-valeurs: true,
  ),
  ctz-intervalle(
    -56, 25,
    couleur: teal, decor: "fond",
    aff-valeurs: true,
  ),
  ctz-intervalle(
    0, 79, type: "OO",
    couleur: purple, decor: "zigzag", niveau-v: 1.5,
    aff-valeurs: true,
  ),
)

#rep-intervalles(
  xmin: -8, xmax: 8,
  graduations: range(-8, 9),
  ctz-intervalle(
    -2, 5,
    decor: "fond",
    aff-valeurs: true, pos-valeurs: "below",
  ),
  ctz-intervalle(
    -7, -1, type: "OO",
    couleur: blue, decor: "zigzag",
    aff-valeurs: true, pos-valeurs: "below",
  ),
  ctz-intervalle(
    "*", 6, type: "FO",
    couleur: orange, decor: "hach", niveau-v: 1.25,
    aff-valeurs: true,
  ),
)

#rep-intervalles(
  xmin: -8, xmax: 8,
  graduations: range(-8, 9),
  ctz-intervalle(
    -2, 5,
    decor: "fond",
    aff-valeurs: true, pos-valeurs: "below",
    label-inf: $a$, label-sup: $b$,
  ),
  ctz-intervalle(
    -calc.sqrt(5), 2 / 3, type: "OO",
    couleur: blue, decor: "fond",
    aff-valeurs: true,
    label-inf: $-sqrt(5)$, label-sup: $2/3$,
  ),
)
