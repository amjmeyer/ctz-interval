// Tests unitaires de src/outils.typ.
#import "aide.typ": *
#import "/src/outils.typ": _nombre, _infini, _est-nombre

#egal(texte(_nombre(12)), "12", quoi: "entier")
#egal(texte(_nombre(-15)), "−15", quoi: "négatif")
#egal(texte(_nombre(1.5)), "1,5", quoi: "décimal")
#egal(texte(_nombre(1 / 3)), "0,3333", quoi: "arrondi à 4 décimales")
#egal(texte(_nombre(2.0)), "2", quoi: "flottant entier")
#egal(texte(_nombre(-10 / 3)), "−3,3333", quoi: "négatif arrondi")
#assert(_infini("*") and _infini(none) and not _infini(0))
#assert(_est-nombre(1) and _est-nombre(1.5) and not _est-nombre("1"))
