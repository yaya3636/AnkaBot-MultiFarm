# SCRIPT PLUS MIS A JOUR ! Télécharger la v2 ici https://github.com/yaya3636/Ankabot-MultiFarm-V2.0

# Script AnkaBot-MultiFarm By Yaya#0355

## Présentation du script

Le script a pour but de gérer tout les métier ainsi que tout leur craft, l'auto leveling (perso et DD), les chasse au trésor, Auto vente

Il fonctionne en sélectionnant le bon métier par rapport a l'heure courante qui sera a configurer dans le script,
Une fois le métier choisi il partira en banque check si il peux craft les items que vous voulez craft par rapport a son métier et son niveau,
vous pouvez modifier la gestion des craft dans un fichier a pars.

Si il peux craft l'item en question il ira le faire, sinon il partira récolter les ressources manquantes pour son craft si elle sont récoltables

A chaque retour banque il vérifiera si il peux mettre en vente les items que vous aurez choisi et il ira update les prix si il le faut

Il gére l'energie de la monture automatiquement si vous avez une monture équiper (auto achat du poisson + nourir)

## Configuration

1. Avoir tout les zaap (les iles ne sont pas obligatoire)
2. Mettre les pods a 101
3. Configurer un minimum le script

### Disclaimer

Des fonction ne marche pas encore liste ci dessous :

* DEPOT_MAISON
* Le job paysan
* La chasse au trésor comporte des bug
* Peut être d'autre

### Première config
Ouvrez le fichier **Multi_v.1.1.lua** et modifier les variable ci dessous
![GitHub Logo](/img/Other.png)

1. **currentDirectory** Très important ! Correspond au chemin du dossier du script dans votre PC
2. **PANDALA|FRIGOST3** Active ou désactive les iles correspondante
3. **AUTO_CRAFT|SELL|BUY** Active ou désactive les option concernée
4. **ADD_ALL_PATH_OF_JOB** Si true le script ajoutera tout les path du métier en question
5. **GATHER_ALL_RESOURCES_OF_JOB** Si true récolte même les ressources qu'il n'a pas besoin pour son craft
6. **TIME_PASS_ZONE** Si true change de path en fonction du temps passez dessus, sinon c'est un système de boucle
7. **pMin, pMax** Pods mini et maxi choisi aléatoirement avant le retour banque
8. **bMin, bMax** Boucle mini et maxi avant changement de path
9. **tMin, tMax** Temps mini et maxi avant changement de path
10. **DEPOT_MAISON** Retour banque ou maison
11. **minMountEnergy** Energie mini avant de nourir la dd
12. **maxMountEnergy** Energie max de votre dd
13. **ID_ITEM_FEED_MOUNT** ID des objet pour nourir votre dd, penser a les acheter automatiquement


### Gestion métier
Pour la gestion des métier ouvrez le fichier **Multi_v.1.1.lua** et modifier a votre guise la table qui et présenté ci dessous
![GitHub Logo](/img/WorkTime.png)

### Gestion craft

Pour la gestion des craft ouvrez le fichier **Multi_IC.lua** et vous tomberez sur quelque chose qui ressemble a ça
![GitHub Logo](/img/Craft.png)

1. **lot** correspond au nombre de lot voulu lorsque le bot pars craft, si lot = nil le bot partira craft quand il pourra remplir son inventaire avec les ingrédient
2. **nbItemsBeforeNextCraft** correspond au nombre d'item voulu en banque avant de passez au prochain craft
3. **active** Active ou désactive le craft
4. **lvlToDesactive** désactive le craft quand le niveau du métier atteint la valeur
5. **minLevel** Level mini avant d'activer le craft
6. Ne pas toucher au reste

### Gestion Stock et récolte

Pour la gestion des Stock ouvrez le fichier **Multi_IC.lua** et vous tomberez sur quelque chose qui ressemble a ça
![GitHub Logo](/img/Stock.png)

1. **priorityToGather** donne une priorité de récolte au bot quand il arrive sur la carte, plus la valeur et haute plus la prio et haute
2. **minStock** Laisse toujours la valeur souhaiter en banque
3. **maxStock** Désactive la récolte quand la valeur et atteinte
4. Ne pas toucher au reste

### Gestion vente et achat

Pour la gestion des vente et achat ouvrez le fichier **Multi_sell.lua** et vous tomberez sur quelque chose qui ressemble a ça
![GitHub Logo](/img/Sell.png)

1. **ITEM_TO_SELL**
    1. **name** Nom de l'objet
    2. **idItem** ID de l'objet
    3. **lot** Vente par lot de 1 = 1, 2 = 10, 3 = 100
    4. **minPrice** Ne met pas l'objet en vente en dessous de cette valeur et n'update pas le prix en dessous de la valeur
    5. **weight** Poid de l'item
    6. **type** Type de l'hdv ( ressource, consommable, equipement, rune )
2. **ITEM_TO_SELL**
    1. **name** Nom de l'objet
    2. **idItem** ID de l'objet
    3. **lot** Achat par lot de 1 = 1, 2 = 10, 3 = 100
    4. **minStock** Stock mini de la ressource avant le rachat
    5. **minPrice** Ne met pas l'objet en vente en dessous de cette valeur et n'update pas le prix en dessous de la valeur
    6. **weight** Poid de l'item
    7. **type** Type de l'hdv ( ressource, consommable, equipement, rune )

### Retour maison

Pour activer le retour maison, ouvrez le fichier **Multi_House.lua** et vous tomberez sur quelque chose qui ressemble a ça
![GitHub Logo](/img/Maison.png)

1. **outHouseMapId** MapId extérieur de la maison
2. **houseMapId** MapId intérieur de la maison sous forme de tableau, map = mapId, path = cellId escalier, mettre chest = true quand vous êtes sur la map du coffre
3. **owner** Pseudo du (compte) propriétaire de la maison
4. **doorHouseCellId** cellid porte de la maison
5. **doorPass** Mot de passe maison
6. **chestCellId** cellid du coffre
7. **chestPass** Mot de passe du coffre
8. N'oublier pas de mettre **DEPOT_MAISON** sur true dans **Multi_v.1.1.lua**
