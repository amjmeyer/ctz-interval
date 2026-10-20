#!/bin/bash
# Refait la partie « Exemples » du README à partir des fichiers 01 à 07,
# puis de doc-proflycee.typ (point 8) :
# chaque dessin devient une image (images/), son code s'affiche en cliquant
# dessus. À relancer après avoir modifié un exemple :
#
#   exemples/readme.sh

cd "$(dirname "$0")/.."
rm -rf images
mkdir -p images

python3 - <<'PY'
import re, subprocess

entete = '''#import "/src/lib.typ": *
#set page(width: auto, height: auto, margin: 6pt, fill: white)
'''
lignes = []

fichiers = [subprocess.run("ls exemples/%02d-*.typ" % n, shell=True, capture_output=True,
                           text=True).stdout.strip() for n in range(1, 8)]
for numero, fichier in enumerate(fichiers + ["exemples/doc-proflycee.typ"], 1):
    texte = open(fichier).read()
    titre = re.search(r"^= (.*)$", texte, re.M).group(1)
    lignes += ["", "### %d. %s" % (numero, titre)]
    # un dessin = un bloc #rpz-interval( … ) terminé par « ) » seul sur sa ligne
    for k, code in enumerate(re.findall(r"^#rpz-interval\(.*?^\)$", texte, re.S | re.M), 1):
        image = "images/%02d-%02d.svg" % (numero, k)
        subprocess.run(["typst", "compile", "--root", ".", "--format", "svg", "-", image],
                       input=entete + code, text=True, check=True)
        lignes += ["", "<details>",
                   '<summary><img src="%s" alt="exemple %d.%d"></summary>' % (image, numero, k),
                   "", "```typ", code, "```", "", "</details>"]

# remplace ce qui est entre les deux repères du README
readme = open("README.md").read()
debut = readme.index("-->", readme.index("<!-- exemples")) + 3
fin = readme.index("<!-- fin des exemples -->")
open("README.md", "w").write(readme[:debut] + "\n".join(lignes) + "\n" + readme[fin:])
PY
echo "README.md : $(ls images | wc -l) dessins"
