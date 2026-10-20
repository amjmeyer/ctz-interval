# ctz-interval — guide pour les agents

Paquet Typst qui dessine des intervalles sur une droite graduée, d'après
`RepIntervalles` (§13) du package LaTeX ProfLycee de Cédric Pierquet. Il
utilise CeTZ. Le code, les clés et les messages sont en français.

## Organisation

```
src/
  lib.typ              point d'entrée : n'exporte que rep-intervalles,
                       rep-intervalles-dessin et ctz-intervalle
  deps.typ             seul import externe (@preview/cetz:0.5.2)
  outils.typ           _nombre, _infini, _est-nombre (non exportés)
  rep-intervalles.typ  tout le reste
exemples/              01-… à 09-… : un fichier par usage ; doc-proflycee.typ
  readme.sh            refait la partie « Exemples » du README
images/                SVG du README, produits par exemples/readme.sh
tests/lancer.sh        lance tous les tests
```

## Fonctionnement

Le travail se fait en deux temps.

1. **`ctz-intervalle(inf, sup, clés)` ne dessine rien.** Elle vérifie ses
   arguments (`panic` avec un message clair sinon) et renvoie un
   dictionnaire, une « fiche » : `(objet: "intervalle", inf: …, sup: …,
   couleur: …, …)`. Au passage, une borne infinie (`"*"` ou `none`) devient
   `none`, et `decor: "hach/60"` devient `decor: "hach"` + `angle: 60deg`.
2. **`rep-intervalles-dessin(clés, ..fiches)` dessine** l'axe, les
   graduations, les valeurs, puis les intervalles. Il refuse toute clé
   inconnue et tout objet qui n'est pas une fiche `objet: "intervalle"`.
   `rep-intervalles` l'enveloppe dans `cetz.canvas(length: 1cm, …)`.

Pourquoi deux temps : seul `rep-intervalles` connaît l'échelle de l'axe, et
il dessine en **deux passes** (toutes les décorations, puis tous les
traits) pour qu'un fond ne masque jamais le crochet d'un autre intervalle.

Repères du dessin (`rep-intervalles-dessin`) :

- Échelle : `u = longueur / (xmax - xmin)` cm par unité si `unite: auto`,
  sinon `unite / 1cm` ; `X(x) = x * u`. Coordonnées CeTZ en cm.
- L'axe dépasse de 5 % de sa longueur de chaque côté (place pour la flèche
  et les bornes infinies). Une borne sup infinie s'arrête 0,2 avant la
  flèche.
- Un intervalle est centré à la hauteur `niveau-v * hauteur` ; ses crochets
  et sa bande de décoration vont de `-hauteur/2` à `+hauteur/2` autour.
- Les nombres de `valeurs` se placent sous le plus bas des deux : grandes
  graduations (`0,8 * haut-grad`) ou crochets (`hauteur / 2`).
- Hachures : droites inclinées de `angle`, coupées à l'intervalle par
  `_dans-bande` (testée à part).
- Étiquette d'une borne : `label-inf`/`label-sup` s'il est donné, sinon
  `_nombre(borne)` (arrondi à 4 décimales, virgule décimale), ou la borne
  telle quelle si `num-inf`/`num-sup: false`.

## Conventions

- Noms et clés en kebab-case français. Les noms internes commencent par `_`
  (non exportés par `lib.typ`).
- En-tête MIT (3 lignes) dans chaque `.typ` de `src/`. Commentaires courts.
- Réécriture indépendante : ne jamais recopier le code de ProfLycee (LPPL).
- Une nouvelle clé ou un nouveau cas : l'ajouter dans `exemples/` et dans le
  tableau des clés du README, avec un test si possible.

## Tests

`tests/lancer.sh` (ou `tests/lancer.sh <début de nom>` pour filtrer)
compile, sans produire de fichier :

- `exemples/*.typ` : doivent compiler sans erreur (un avertissement est
  signalé, sans compter comme échec) ;
- les blocs ```` ```typ ```` du README ;
- `tests/unitaires/*.typ` : assertions (`aide.typ` fournit `egal`, `texte`,
  `releve-textes`) ;
- `tests/erreurs/*.typ` : doivent échouer avec le message annoncé en
  première ligne (`// attendu : …`).

Code de sortie = nombre d'échecs. Après avoir modifié un exemple ou le
rendu, relancer `exemples/readme.sh` : il recompile les dessins de
`01-…` à `07-…` et de `doc-proflycee.typ` en SVG et réécrit le README entre
les repères `<!-- exemples … -->` et `<!-- fin des exemples -->` (ne pas
modifier cette partie à la main). Un dessin = un bloc qui commence par
`#rep-intervalles(` et se termine par `)` seul sur sa ligne.

## Pièges connus

- Le paramètre `type` de `ctz-intervalle` masque la fonction `type()` dans
  son corps : tester les types dans `outils.typ` (`_est-nombre`).
- Les bornes sont des nombres Typst (`0`, `2 / 3`, `calc.sqrt(5)`), jamais
  du texte (`"0"`) ni du contenu (`$sqrt(5)$`) ; seul `"*"` est accepté
  comme texte (borne infinie).
- `police` est passé à `text(..police, fill: …)` : y mettre `fill`
  provoque une erreur (argument en double).
- En mode math, un nom à tiret (`ctz-intervalle`) se lit comme une
  soustraction : l'appeler avec `#`.
