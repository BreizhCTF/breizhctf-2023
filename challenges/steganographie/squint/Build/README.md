# Build

Pour créer le challenge utiliser la commande :

```bash
python magicpy.py 'BZHCTF{Motosterogram?}'
```

Cette dernier permet de créer l'[autostereogram](https://fr.wikipedia.org/wiki/Autost%C3%A9r%C3%A9ogramme) `output.png`.

Cacher ensuite cette image dans un fichier APNG (Equivalent GIF), avec comme images sources "original.jpg" et "output.png".

Préciser une durée longue pour l'image originale et nule pour l'image "output.png":

![build_screenshot.png](build_screenshot.png)

Enregistrez ensuite l'image et renommez la `squint.png`.

Supprimez les métadonnées avec exiftool: `exiftool -all= squint.png && rm squint.png_original`.

Vérifiez que format de fichier soit bien `image/apng` et que les métadonnées aient été supprimées (notamment les commentaires) à l'aide de la commande `exiftool squint.png`.

Calculez ensuite le `md5sum squint.png` et mettez à jour l'énoncé.