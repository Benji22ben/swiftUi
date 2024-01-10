#  Exercices Swift UI

## 🔧 Exercice 1

**Essayez de lancer l’application (ou de la visualiser dans la preview), XCode devrait vous afficher une erreur. Que manque-t-il ? Et pourquoi ?**
Il manque l'identifier (id) qui permet de générer la **List**, on peut contourner ce problème en ajoutant :
```
        List(loot, id: \.self)
```

## 🔧 Exercice 2
**Expliquez le changement que j’ai effectué par rapport à l’exemple précédent.**
Un Bouton "Ajouter" à été ajouté et un ForEach est apparu pour construire la liste

**Pourquoi utiliser un ForEach ? Quel est son rôle ? Et pourquoi séparer le bouton du ForEach ?**
Le ForEach permet d'avoir plus de contrôle sur la liste et d'afficher ce que l'on souhaite en plus de la liste (comme le button) dans le composant de List.


## 🔧 Exercice 3

**Testez ce code, fonctionne-t-il ? Pourquoi ?**
Non le code ne fonctionne pas car il manque le wrapper `@State`.

**Expliquez pourquoi maintenant cela fonctionne ?**
Cela fonctionne car le wrapper `@State` permet de rendre la variable "loot" modifiable.

# Créer l'inventaire

## 🔧 Exercice 1

**Cliquez sur le bouton “Ajouter”, que se passe-t-il ? Pourquoi cela ne marche pas ?**
Il ne se passe rien et cela ne fonctionne pas car inventory n'est pas modifiable. Il faut ajouter @StateObject à Inventory.

**Si vous ajoutez plusieurs items, que se passe-t-il dans la console XCode, vous devriez avoir un message d’erreur, expliquez pourquoi ?**
Je ne sais pas ce que j'ai mal fait mais tout fonctionne

## Exercice 2
**Pourquoi cela fonctionne de nouveau ?**
La variable `inventory` est maintenant accessible
 
**Pourquoi utiliser @StateObject plutôt que @ObservedObject ou @State ?**
StateObject n'écrase pas le tableau de donnée il modifie juste la donnée spécifique (pas comme ObservedObject) tandis que `@State` ne peut pas comparer un objet. Seulement les types simples.






