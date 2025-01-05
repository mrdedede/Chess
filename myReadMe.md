# **Fix Pawn Moves (Salim TITOUCHE)**

## **Introduction**

Ce projet vise à corriger et à implémenter les mouvements légaux des pions dans un jeu d'échecs. Ces fonctionnalités nécessitent une compréhension approfondie des règles d'échecs, de la détection des erreurs et du développement incrémental.

---

## **Objectifs**

Les pions sont parmi les pièces les plus complexes à implémenter en raison des règles suivantes :
- Les pions se déplacent vers l'avant d'une case.
- Lors de leur premier mouvement, ils peuvent avancer de deux cases.
- Les pions capturent en diagonale, une case en avant.
- La règle spéciale "En passant" ajoute une complexité supplémentaire.

---

## **Méthodes Développées**

### **Mouvements de base des pions**
1. **`Pawn>>targetSquaresLegal`**
   - Retourne les cases vers lesquelles un pion peut légalement se déplacer.
   - Gère les mouvements simples, les doubles déplacements initiaux et les captures diagonales.

2. **`Pawn>>doubleStepSquare`**
   - Identifie la case cible pour un déplacement initial de deux cases.

3. **`Pawn>>canCapture:`**
   - Vérifie si un pion peut capturer une pièce donnée.

4. **`Pawn>>moveTo:`**
   - Déplace un pion vers une case donnée, en respectant les règles des mouvements légaux.

5. **`Pawn>>isFirstMove`**
   - Retourne vrai si le pion n’a pas encore été déplacé.

6. **`Pawn>>enPassantMove:`**
   - Implémente le mouvement spécial "En passant", permettant à un pion de capturer un pion adverse qui a effectué un double déplacement initial.

---

## **Tests Implémentés**

### **Tests pour les mouvements des pions**
1. **`testPawnFirstMoveTwoSquares_White`**
   - Vérifie qu’un pion blanc peut avancer de deux cases lors de son premier mouvement.

2. **`testPawnFirstMoveTwoSquares_Black`**
   - Vérifie qu’un pion noir peut avancer de deux cases lors de son premier mouvement.

3. **`testPawnCannotMoveTwoSquaresAfterFirstMove`**
   - Vérifie qu’un pion ne peut pas avancer de deux cases après son premier mouvement.

4. **`testPawnCannotCaptureStraightAhead`**
   - Vérifie qu’un pion ne peut pas capturer une pièce se trouvant directement devant lui.

5. **`testPawnDiagonalCapture`**
   - Vérifie qu’un pion peut capturer une pièce en diagonale.

6. **`testPawnEnPassant`**
   - Implémente et teste le mouvement spécial "En passant".

---

## **Approche Incrémentale**

### **1. Décomposition en sous-tâches**
Pour chaque fonctionnalité, le développement a été effectué par étapes :
1. Implémentation des mouvements simples (avant d'une case, double mouvement initial).
2. Gestion des captures diagonales.
3. Validation des tests pour les cas de base avant d'ajouter la règle "En passant".

### **2. Outils utilisés pour la détection des bugs**
- Tests unitaires pour valider chaque règle et cas particulier.
- Débogage incrémental pour vérifier les états intermédiaires du jeu.
- Utilisation d'une approche TDD (Test-Driven Development).

---

## **Résultats**

Tous les mouvements légaux des pions sont désormais conformes aux règles d'échecs, y compris :
   - Mouvements initiaux.
   - Captures diagonales.
   - Mouvement "En passant".

---

## **Conclusion**

Ce projet a permis d'explorer des techniques avancées de débogage et de validation des règles de jeu par le biais de tests unitaires. Grâce à une approche incrémentale, il a été possible de corriger les bugs existants, d'ajouter des fonctionnalités complexes et de garantir leur robustesse. Cette méthodologie peut être utilisée pour étendre le jeu à d'autres pièces à l'avenir.
