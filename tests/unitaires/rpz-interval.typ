// Tests unitaires de src/rpz-interval.typ.
#import "aide.typ": *
#import "/src/rpz-interval.typ": rpz-interval, ctz-interval, _dans-bande

// valeurs par défaut
#{
  let i = ctz-interval(-2, 5)
  egal(i.color, red, quoi: "color")
  egal(i.type, "CC", quoi: "type")
  egal(i.level, 0, quoi: "level")
  egal(i.decor, none, quoi: "decor")
  egal(i.show-values, false, quoi: "show-values")
  egal(i.pos-values, "above", quoi: "pos-values")
}

// bornes infinies
#egal(ctz-interval("*", 6).inf, none, quoi: "* à gauche")
#egal(ctz-interval(0, "*").sup, none, quoi: "* à droite")
#egal(ctz-interval(none, none).inf, none, quoi: "none")

// hachures
#egal(ctz-interval(0, 1, decor: "hatch").angle, 45deg, quoi: "angle par défaut")
#egal(ctz-interval(0, 1, decor: "hatch/60").angle, 60deg, quoi: "hatch/60")
#egal(ctz-interval(0, 1, decor: "hatch/60").decor, "hatch", quoi: "decor hatch/60")

// découpe des hachures
#egal(_dans-bande((0, 0), (2, 2), 0.5, 1), ((0.5, 0.5), (1, 1)), quoi: "découpe")
#egal(_dans-bande((0, 0), (1, 1), 2, 3), none, quoi: "hors bande")
#egal(_dans-bande((1, 0), (1, 1), 0, 2), ((1, 0), (1, 1)), quoi: "verticale")

// textes affichés : valeurs de l'axe, étiquettes des bornes, infini sans étiquette
#releve-textes("r1", rpz-interval(xmin: -2, xmax: 2, values: (-1, 1.5),
  ctz-interval("*", 0.5, show-values: true),
))
#context egal(textes("r1"), "11,50,5", quoi: "textes affichés (sans les signes ni les lettres mathématiques)")

#releve-textes("r2", rpz-interval(
  ctz-interval(1, 2, show-values: true, label-inf: [début]),
))
#context egal(textes("r2"), "début2", quoi: "labels")
