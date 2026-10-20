#import "../src/lib.typ": *
#set page(width: 16cm, height: auto, margin: 1cm)

= Valeurs

#rep-intervalles(
  xmin: -5, xmax: 5,
  graduations: range(-5, 6),
  valeurs: range(-5, 6),
  ctz-intervalle(
    -2, 3, type: "FO",
  ),
)

#rep-intervalles(
  xmin: 0, xmax: 3,
  graduations: range(0, 7).map(k => k / 2),
  valeurs: range(0, 7).map(k => k / 2),
  ctz-intervalle(
    0.5, 2.5, type: "FO",
  ),
)

#rep-intervalles(
  xmin: -3, xmax: 4,
  graduations: range(-3, 5), 
  valeurs: range(-3,5),
  ctz-intervalle(
    -calc.sqrt(2), 10/3, type: "OO",
    couleur: blue, decor: "fond",
    aff-valeurs: true, label-inf: $sqrt(2)$, label-sup: $10/3$
  ),
)

#rep-intervalles(
  xmin: 0, xmax: 10,
  ctz-intervalle(
    2, 7,
    decor: "fond", aff-valeurs: true, pos-valeurs: "below",
    label-inf: $a$, label-sup: $b$,
  ),
)

#rep-intervalles(
  xmin: -2, xmax: 3,
  graduations: range(-6, 10).map(k => k / 3),
  graduations-alt: range(-2, 4),
  valeurs: range(-2, 4),
  ctz-intervalle(
    -2/3, 5/3, type: "FO",
    couleur: blue, decor: "fond",
    aff-valeurs: true, 
  ),
)

#rep-intervalles(
  xmin: -2, xmax: 3,
  graduations: range(-6, 10).map(k => k / 3),
  graduations-alt: range(-2, 4),
  valeurs: range(-2, 4),
  ctz-intervalle(
    -2/3, 5/3, type: "FO",
    couleur: blue, decor: "fond",
    aff-valeurs: true, label-inf: $-2/3$, label-sup: $5/3$,
  ),
)
