// Copyright (c) 2026 Arthur Meyer
// SPDX-License-Identifier: MIT
// Voir le fichier LICENSE à la racine du paquet.
 
// le paquet étant petit, tous les outils et dépendances servent là
#import "deps.typ": cetz
#import "outils.typ": _nombre, _infini, _est-nombre 

#let _types = ("FF", "FO", "OF", "OO")

// cette fonction permet de donner toutes les informations sur 
// l'intervalle à représenter. La fonction suivante lira ces 
// données pour représenter l'intervalle. 
// Cette partie sert aussi à faire afficher des messages 
// d'erreurs clairs

#let ctz-intervalle(
  inf,
  sup,
  couleur: red,
  type: "FF",
  niveau-v: 0,
  decor: none,
  aff-valeurs: false,
  num-inf: true,
  num-sup: true,
  pos-valeurs: "above",
  label-inf: auto,
  label-sup: auto,
) = {
  if type not in _types {
    panic("ctz-intervalle : type doit être \"FF\", \"FO\", \"OF\" ou \"OO\", pas " + repr(type))
  }
  for (nom, b) in (("inf", inf), ("sup", sup)) {
    if not (_infini(b) or _est-nombre(b)) {
      panic("ctz-intervalle : la borne " + nom + " doit être un nombre, \"*\" ou none, pas " + repr(b))
    }
  }
  if not _infini(inf) and not _infini(sup) and inf >= sup {
    panic("ctz-intervalle : la borne inf (" + repr(inf) + ") doit être strictement inférieure à la borne sup (" + repr(sup) + ")")
  }
  let angle = 45deg
  if decor != none {
    let morceaux = str(decor).split("/")
    if morceaux.at(0) not in ("fond", "zigzag", "hach") or (morceaux.len() > 1 and morceaux.at(0) != "hach") or morceaux.len() > 2 {
      panic("ctz-intervalle : decor doit être none, \"fond\", \"zigzag\", \"hach\" ou \"hach/<angle>\", pas " + repr(decor))
    }
    if morceaux.len() == 2 {
      let a = float(morceaux.at(1))
      if calc.rem(a, 180) == 0 { panic("ctz-intervalle : hachures horizontales impossibles (angle " + morceaux.at(1) + ")") }
      angle = a * 1deg
    }
  }
  if pos-valeurs not in ("above", "below") {
    panic("ctz-intervalle : pos-valeurs doit être \"above\" ou \"below\", pas " + repr(pos-valeurs))
  }
  (
    objet: "intervalle",
    inf: if _infini(inf) { none } else { inf },
    sup: if _infini(sup) { none } else { sup },
    couleur: couleur, type: type, niveau-v: niveau-v,
    decor: if decor == none { none } else { str(decor).split("/").at(0) },
    angle: angle, aff-valeurs: aff-valeurs, num-inf: num-inf, num-sup: num-sup,
    pos-valeurs: pos-valeurs, label-inf: label-inf, label-sup: label-sup,
  )
}

// Segment de la droite p0–p1 compris dans la bande a ≤ x ≤ b (ou none).
#let _dans-bande(p0, p1, a, b) = {
  let dx = p1.at(0) - p0.at(0)
  if dx == 0 { return if a <= p0.at(0) and p0.at(0) <= b { (p0, p1) } else { none } }
  let s0 = calc.max(0, calc.min((a - p0.at(0)) / dx, (b - p0.at(0)) / dx))
  let s1 = calc.min(1, calc.max((a - p0.at(0)) / dx, (b - p0.at(0)) / dx))
  if s0 >= s1 { return none }
  let point(s) = (p0.at(0) + s * dx, p0.at(1) + s * (p1.at(1) - p0.at(1)))
  (point(s0), point(s1))
}

#let rep-intervalles-dessin(
  xmin: -8,
  xmax: 8,
  longueur: 12,
  unite: auto,
  ep-trait: 1pt,
  graduations: (),
  graduations-alt: (),
  haut-grad: 7pt,
  hauteur: 12pt,
  valeurs: (),
  police: (:),
  ..objets,
) = {
  if xmin >= xmax { panic("rep-intervalles : xmin (" + repr(xmin) + ") doit être strictement inférieur à xmax (" + repr(xmax) + ")") }
  if objets.named().len() > 0 { panic("rep-intervalles : clé inconnue " + repr(objets.named().keys().first())) }
  for o in objets.pos() {
    if type(o) != dictionary or o.at("objet", default: none) != "intervalle" {
      panic("rep-intervalles : on n'y met que des ctz-intervalle(…), pas " + repr(o))
    }
  }
  let u = if unite == auto { longueur / (xmax - xmin) } else { unite / 1cm }
  let X(x) = x * u
  // l'axe dépasse de 5 % de chaque côté, pour la flèche et les bornes infinies
  let marge = 0.05 * (X(xmax) - X(xmin))
  let (gauche, droite) = (X(xmin) - marge, X(xmax) + marge)
  let h = hauteur / 1cm
  let hg = haut-grad / 1cm
  let ep = ep-trait
  let etiquette(c, couleur: black) = text(..police, fill: couleur, c)

  import cetz.draw: *

  // Axe, graduations, valeurs
  line((gauche, 0), (droite, 0), stroke: ep, mark: (end: "stealth", fill: black, scale: 0.8))
  for x in graduations { line((X(x), -hg / 2), (X(x), hg / 2), stroke: ep) }
  for x in graduations-alt { line((X(x), -hg * 0.8), (X(x), hg * 0.8), stroke: ep) }
  // sous les graduations et sous les crochets, pour ne pas les chevaucher
  let y-valeurs = -calc.max(hg * 0.8, h / 2)
  for x in valeurs {
    content((X(x), y-valeurs), anchor: "north", padding: 2pt, etiquette(_nombre(x)))
  }

  let intervalles = objets.pos()
  // Deux passes : les décorations d'abord, pour qu'aucune ne masque un trait.
  for passe in ("decor", "trait") {
    for it in intervalles {
      let c = it.couleur
      let y = it.niveau-v * h
      let a = if it.inf == none { gauche } else { X(it.inf) }
      let b = if it.sup == none { droite - 0.2 } else { X(it.sup) }
      let (bas, haut) = (y - h / 2, y + h / 2)

      if passe == "decor" {
        if it.decor == "fond" {
          rect((a, bas), (b, haut), fill: c.transparentize(70%), stroke: none)
        } else if it.decor == "zigzag" {
          let n = calc.max(2, int(calc.round((b - a) / (h * 0.6))))
          let pas = (b - a) / n
          line(..range(n + 1).map(k => (a + k * pas, if calc.odd(k) { haut } else { y })), stroke: c + ep)
        } else if it.decor == "hach" {
          // hachures inclinées de `angle`, écartées de 0,4 hauteur, coupées à [a ; b]
          let dx = h / calc.tan(it.angle)       // décalage horizontal d'un bord à l'autre
          let pas = h * 0.4 / calc.abs(calc.sin(it.angle))
          let debut = calc.min(a, a - dx)
          let n = int(calc.ceil((b - debut + calc.abs(dx)) / pas))
          for k in range(n + 1) {
            let x0 = debut + k * pas
            let morceau = _dans-bande((x0, bas), (x0 + dx, haut), a, b)
            if morceau != none { line(..morceau, stroke: c + 0.5 * ep) }
          }
        }
      } else {
        line((a, y), (b, y), stroke: c + 2 * ep)
        // Un crochet fermé « regarde » l'intérieur de l'intervalle, un ouvert l'extérieur.
        let w = h * 0.3
        let crochet(x, sens) = line(
          (x + sens * w, y + h / 2), (x, y + h / 2), (x, y - h / 2), (x + sens * w, y - h / 2),
          stroke: c + 2 * ep,
        )
        if it.inf != none { crochet(a, if it.type.at(0) == "F" { 1 } else { -1 }) }
        if it.sup != none { crochet(b, if it.type.at(1) == "F" { -1 } else { 1 }) }

        if it.aff-valeurs {
          let (ordonnee, ancre) = if it.pos-valeurs == "above" { (y + h / 2, "south") } else { (y - h / 2, "north") }
          for (borne, x, label, num) in ((it.inf, a, it.label-inf, it.num-inf), (it.sup, b, it.label-sup, it.num-sup)) {
            if borne == none { continue }
            let e = if label != auto { label } else if num { _nombre(borne) } else { $#str(borne)$ }
            content((x, ordonnee), anchor: ancre, padding: 2pt, etiquette(e, couleur: c))
          }
        }
      }
    }
  }
}

#let rep-intervalles(..args) = (
  cetz.canvas(
    length: 1cm, 
    rep-intervalles-dessin(..args)
  )
)
 