// Tests unitaires de src/rep-intervalles.typ.
#import "aide.typ": *
#import "/src/rep-intervalles.typ": rep-intervalles, ctz-intervalle, _dans-bande

// valeurs par défaut (celles de ProfLycee)
#{
  let i = ctz-intervalle(-2, 5)
  egal(i.couleur, red, quoi: "couleur")
  egal(i.type, "FF", quoi: "type")
  egal(i.niveau-v, 0, quoi: "niveau-v")
  egal(i.decor, none, quoi: "decor")
  egal(i.aff-valeurs, false, quoi: "aff-valeurs")
  egal(i.pos-valeurs, "above", quoi: "pos-valeurs")
}

// bornes infinies
#egal(ctz-intervalle("*", 6).inf, none, quoi: "* à gauche")
#egal(ctz-intervalle(0, "*").sup, none, quoi: "* à droite")
#egal(ctz-intervalle(none, none).inf, none, quoi: "none")

// hachures
#egal(ctz-intervalle(0, 1, decor: "hach").angle, 45deg, quoi: "angle par défaut")
#egal(ctz-intervalle(0, 1, decor: "hach/60").angle, 60deg, quoi: "hach/60")
#egal(ctz-intervalle(0, 1, decor: "hach/60").decor, "hach", quoi: "decor hach/60")

// découpe des hachures
#egal(_dans-bande((0, 0), (2, 2), 0.5, 1), ((0.5, 0.5), (1, 1)), quoi: "découpe")
#egal(_dans-bande((0, 0), (1, 1), 2, 3), none, quoi: "hors bande")
#egal(_dans-bande((1, 0), (1, 1), 0, 2), ((1, 0), (1, 1)), quoi: "verticale")

// textes affichés : valeurs de l'axe, étiquettes des bornes, infini sans étiquette
#releve-textes("r1", rep-intervalles(xmin: -2, xmax: 2, valeurs: (-1, 1.5),
  ctz-intervalle("*", 0.5, aff-valeurs: true),
))
#context egal(textes("r1"), "11,50,5", quoi: "textes affichés (sans les signes ni les lettres mathématiques)")

#releve-textes("r2", rep-intervalles(
  ctz-intervalle(1, 2, aff-valeurs: true, label-inf: [début], num-sup: false),
))
#context egal(textes("r2"), "début2", quoi: "labels")
