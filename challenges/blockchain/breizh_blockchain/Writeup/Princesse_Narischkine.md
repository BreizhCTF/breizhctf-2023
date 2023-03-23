## Objectif
L'objectif de ce challenge est d'ouvrir la porte secrète pour sauver la princesse dans le Chateau de Keriolet.

## Détails
Pour réussir ce challenge, il faut dans un premier temps devenir le chevalier de la princesse, ce qui permettra de définir un nouveau code et également d'ouvrir la porte secrète gardant la princesse Narischkine enfermée.

## Attaque
Pour résoudre le challenge, nous devons ouvrir la porte secrète. La stratégie consiste en remplacer l'adresse du chevalier de la princesse par notre propre adresse pour devenir son chevalier. Ensuite, il faut appeler la fonction `setCode()` dans le contrat `Princesse` pour changer le code de la porte secrète. Enfin, nous pouvons appeler la fonction `openTheSecretDoor()` dans le contrat `ChateauDeKeriolet` en passant le nouveau code défini par notre propre adresse.

1.  Appeler la fonction `becomeTheKnight()` dans le contrat `Princesse` en passant notre propre adresse comme nouvelle addresse `knight`.
2.  Appeler la fonction `setCode()` dans le contrat `Princesse` en passant un nouveau code arbitraire.
3.  Appeler la fonction `openTheSecretDoor()` dans le contrat `ChateauDeKeriolet` en passant le nouveau code défini par notre propre adresse.

Une fois toutes ces étapes terminées avec succès, la variable `door` sera mise à `true`, la porte secrète s'ouvrira et la princesse pourra être sauvé par son preux chevalier.