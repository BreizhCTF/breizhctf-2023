BreizhCTF 2023 - BèhCrypte
==========================

### Challenge details

| Event          | Challenge | Category | Points | Solves |
| -------------- | --------- | -------- | ------ | ------ |
| BreizhCTF 2023 | BèhCrypte | Web      | ???    | ???    |

![Goat](https://media.tenor.com/2IIlBalXeCsAAAAC/ocg-werebaaad.gif)

Auteur: [Zeecka](https://twitter.com/Zeecka_)

https://behcrypte.ctf.bzh/

### TL;DR

L'application est un script php très minimaliste affichant son code source. Lavulnérabilité à exploiter réside dans la gestion des chaines de caractères, et notamment des nullbytes, lors de l'utilisation de `bcrypt`. En effet, l'utilisation de la fonction `hash()` avec le troisième paramètre égal à `true` permet de récupérer un premier hash `gost` sous sa forme **binaire** et non hexadécimale, impliquant ainsi la possibilité d'avoir une chaine de caractères avec des nullbytes. Cette chaine est ensuite passée à un deuxième algorithme de hachage `bcrypt` au travers des fonctions `password_hash()` et `password_verify()`. L'utilisation d'un nullbyte dans la chaine de caractère passé à bcrypt permet de tronquer la chaine en question. Le hash initial dispose d'un nullbyte au début de sa chaine de caractère, rendant les collisions plus faciles à obtenir.

### Méthodologie

L'ouverture de l'application nous permet de récupérer un code PHP minimaliste:

```php
<?php
/*
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣤⣶⣶⠶⢶⡶⠶⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣴⠶⡶⠶⢶⣶⣦⣤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣴⠟⠋⠛⠻⢦⣙⢿⣟⢃⣀⠈⠙⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⡟⠋⢀⣀⠛⣷⣿⣥⠾⠛⠛⠛⢦⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⡾⠋⠀⠀⠀⢀⣠⣤⣽⣷⣿⣏⣁⣤⠀⠘⣷⡀⠀⠀⠀⠀⠀⠀⠀⠀⣰⠟⠀⢀⣄⣉⣿⣷⣿⣥⣤⣄⠀⠀⠀⠈⠻⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⣄⣀⣀⣤⠴⠟⠁⣀⣠⡴⠖⠛⠉⠀⠀⠀⠈⠉⢿⡍⢀⣀⡀⠸⣧⠀⠀⠀⠀⠀⠀⠀⢰⡟⠀⣀⣀⠈⣽⠟⠁⠀⠀⠀⠉⠙⠻⠶⣤⣀⡈⠙⠳⢦⣄⣀⣀⡀⠀⠀⠀
⠀⠀⠀⠀⠀⠉⠛⠛⠓⠚⠛⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣿⠋⠉⠀⠀⢹⡆⠀⠀⠀⠀⠀⠀⣾⠁⠀⠈⠉⢻⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠛⠒⠚⠛⠋⠁⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⡶⠋⠙⠷⠾⣿⠀⠀⠀⠀⠀⢰⡇⠲⠛⠙⠳⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣷⠞⠛⠷⠤⢿⡇⠀⠀⠀⠀⣿⠧⠴⠞⠳⢶⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⣤⠶⣤⣀⣠⣇⠀⠀⠀⢰⣿⣀⣠⡴⣦⣾⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣇⣀⡀⠉⠉⣿⡀⠀⠀⢸⡋⠉⠁⣀⣀⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡏⢀⣙⠛⠚⢻⡇⠀⠀⡾⠓⠖⢛⡁⠈⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⠛⠉⠙⠲⢾⣧⠀⣰⣷⠖⠛⠋⠉⢻⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⡤⠶⠞⠛⣻⠟⠛⠻⢿⣦⡀⠀⠀⠈⠉⠁⠀⠀⠀⣠⣴⠾⠛⠛⢿⡛⠻⠶⢦⣄⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⣠⣤⠶⠶⢤⣤⣴⡟⠋⠉⠀⠀⠀⢸⡏⠀⠀⠀⠀⠹⣟⠳⣦⣤⣄⣤⣤⠶⢺⡟⠁⠀⠀⠀⢸⡷⠀⠀⠀⠈⠉⠛⣷⣤⣤⠴⠶⣦⣤⡀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⢰⡟⡀⠀⠀⠀⣴⠟⠋⠛⠶⢦⣄⣀⣠⣿⣤⣄⡀⠀⠀⠸⣦⠀⠀⠀⠀⠀⢠⡟⠁⠀⠀⣀⣤⣼⣧⣤⣠⣤⠴⠞⠋⠛⢷⡄⠀⠀⠀⠈⣷⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠻⣦⣀⠀⠀⠻⠦⠤⠤⠶⠚⢛⣭⠾⣿⣿⢬⡹⣦⠀⠀⢿⡆⠀⠀⠀⠀⣾⠃⠀⢠⣞⣯⣤⣽⡿⢮⣙⠛⠲⠦⠤⠤⠞⠃⠀⢀⣤⡾⠋⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠓⠲⠦⠤⠴⠶⠒⠛⠋⠁⠀⠙⣿⣾⠿⣽⡆⠀⠸⡇⠀⠀⠀⠀⣿⠀⠀⣿⡿⢷⣿⠟⠀⠀⠉⠛⠒⠶⠦⠴⠴⠶⠒⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡏⠻⠿⣷⠀⠀⡇⠀⠀⠀⠐⡇⠀⢸⠻⠟⠋⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡇⠀⠀⢹⡄⢠⡇⠀⠀⠀⠀⣿⠀⢸⠀⠀⢀⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⣆⠀⢸⡇⣸⠃⠀⠀⠀⠀⢿⡀⣸⠀⢀⣼⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⣄⠸⣧⡿⠀⠀⠀⠀⠀⠘⣷⡟⠀⡾⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⠀⣸⠃⣴⠄⠀⠀⢠⡀⢿⡄⣼⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣇⡟⠀⣯⠀⠀⠀⢸⣇⢸⡇⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢻⡇⠘⢿⣧⡀⣰⣿⠟⢸⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⣿⡀⠀⠉⠛⠋⠁⠀⣸⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢿⡻⢦⣀⠀⢀⣠⢾⣻⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠺⢿⣄⣉⣙⣋⣠⡾⠛⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠙⣿⡏⢻⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⣴⡟⣇⣾⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⠀⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⡿⣶⡿⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
*/
    include('flag.php');
    $banned_secret = 'BreizhCTF-2023-pwd-702';
    $stored_hash = password_hash(hash('gost', $banned_secret, true),  PASSWORD_BCRYPT);
    if (isset($_POST['flag']) && $_POST['flag'] != $banned_secret){
        if (password_verify(hash('gost', $_POST['flag'], true), $stored_hash)){
            echo($flag);
            exit();
        }
        die("Erreur !");
    }
    highlight_file(__FILE__);
?>
```

La lecture du code PHP nous permet d'identifier les points suivants:
- Pour afficher le flag:
  - Un paramètre `flag` doit être passé dans une requête `POST` et être différent de la chaine `BreizhCTF-2023-pwd-702`;
  - La fonction `password_verify()` comparant un hash original et l'entrée utilisateur doit être satisfaite;
- Le hash original est un dérivé de la chaine `BreizhCTF-2023-pwd-702`, la même dérivation est appliqué au paramètre `flag` soumis.
- La dérivation se base sur un premier hash `gost` à l'aide de  la fonction `hash('gost', $val, true)`, puis sur un hash `bcrypt` à l'aide de la fonction `password_hash($val, PASSWORD_BCRYPT)`;

Quelques recherches sur la fonction `password_verify()` nous permet de découvrir le [risque liée à l'utilisation de `bcrypt` et `password_verify()`](https://blog.ircmaxell.com/2015/03/security-issue-combining-bcrypt-with.html#The-Major-Problem), notamment lors de la présence de nullbytes.

Bien qu'il soit difficilement possible pour un utilisateur d'envoyer un nullbyte directement au moteur PHP, l'utilisation de la fonction [`hash()`]((https://www.php.net/manual/en/function.hash.php)) avec son paramètre `binary = true` permet la génération de tels caractères. En accord avec nos recherches, les chaines de caractères disposant d'un nullbyte sont tronquées lors de leur utilisation avec `bcrypt`, et permettent donc des collisions.

Tout comme dans les exemples d'exploitations disponibles sur internet, le code source utilise la fonction [`hash()`](https://www.php.net/manual/en/function.hash.php) avec son troisième paramètre (binary) à `true`. Afin de vérifier si le hash initial contient un nullbyte, il suffit de le recalculer sous sa forme hexadécimale (et non binaire).

```php
<?php
print(hash('gost', 'BreizhCTF-2023-pwd-702', false);
?>
```
```plaintext
d4001341e5a7606f10f09b33bfa5248e65eb70b8defe704d6095234d1264e0a5%
```

On a effectivement un nullbyte dès le deuxième caractère (00). Afin de valider le challenges, nous devons donc trouver un hash `ghost` commencant par le caractère `0xd4` suivi d'un nullbyte (autrement dit, dont l'hexadecimal commence par `d400`). Le reste de la chaine de caractère sera tronqué par `bcrypt`, et la condition sera validé.

L'écriture d'un script de bruteforce reprenant les fonctions php du challenge permet de générer un tel hash :

```php
<?php
    $i = 0;
    while(true){
        $pass = "$i";
        $h = hash('gost', $pass);
        // Pour rappel hash('ghost', 'BreizhCTF-2023-pwd-702'); = d4001341e5a7606f10f09b33bfa5248e65eb70b8defe704d6095234d1264e0a5
        if ($h[0] == 'd' && $h[1] == '4' &&
            $h[2] == '0' && $h[3] == '0'){
            print("Le mot de passe $pass donne le hash gost suivant:");
            print("\n");
            print("$h\n");
            return;
        }
        $i++;
    }
?>
```
```bash
php -f script.php
```
```plaintext
Le mot de passe 88292 donne le hash gost suivant:
d4005e1329be36faa0ef66cdf5cc069edff34f6cc6032a06c95d2d85601b3875
```

On peut maintenant submit notre paramètre flag à l'aide de la requête curl suivante:

```bash
curl -X POST -d "flag=88292" https://behcrypte.ctf.bzh/
```
```plaintext
BZHCTF{who_you_gonna_call?_GOAT_BUTTER!!}
```

#### Flag

`BZHCTF{who_you_gonna_call?_GOAT_BUTTER!!}`

Auteur: [Zeecka](https://twitter.com/zeecka_)