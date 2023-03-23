# Notes

Pour comprendre leur secret, vous disposez de deux oeuvres d'art originales ainsi que la configuration respectives utilisées par l'une de ces fourmis.

Comme toute civilisation, les fourmis sont fieres de leurs artistes !
Retrouvez la configuration à l'origine de l'oeuvre d'art de Michel ANTge (`challenge.png`)!

Le flag est sous la forme `BZCTF{md5sum(`config.json`)}`. Par exemple, pour l'oeuvre d'art original (exemple1.png), le flag serait `BZHCTF{96d82d44c86db6cef3e5c245a3c52a29}`.


## Fourmi

La fourmi est désignée par un rond noir. Chaque étape de la fourmis s'effectue de la sorte:
1. Vérifier la couleur sur laquelle elle se situe
2. Modifier la couleur
3. Tourner dans le sens approprié
4. Avancer

A noter que lors de sa dernière étape, la fourmi n'effectuera pas les points 3. et 4.
Elle restera alors sur la dernière case qu'elle a coloré.

La fourmi commence toujours sur la case centrale de sa toile, son orientation de départ de la fourmi se situe vers le haut.
Les cases transparentes (comme la première case par exemple), est considéré comme une case blanche par la fourmi.

## Couleurs

Le mode de couleurs utilisé chez nos amis fourmis est limité au couleurs suivantes.
Dans les configurations, ces dernières sont triées par ordre alphabétique:

- cadetblue
- chartreuse
- hotpink
- red
- seagreen
- white (couleur par default)
- yellow

## Format de flag

Une fois que vous avez identifié les différents paramètres de la configuration, prenez soin de respecter la structure de la config json: 4 espaces pour la tabulation, 1 espace après les `:`, Lettre entre double quote `"`, Saut de ligne après les accolades ouvrantes `{` seulement... 

Vous pouvez également vous aider du formatteur https://jsonformatter.org/ avec l'option "4 espaces".

Une fois le fichier de config sauvegardé (vérifiez à ce qu'il n'y ai pas de saut de ligne en fin de fichier), procéder au calcul du flag avec la commande:

```bash
md5sum config.json
```

Votre flag sera donc BZCTF{valeurcalculee}.
