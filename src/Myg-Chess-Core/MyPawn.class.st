Class {
	#name : 'MyPawn',
	#superclass : 'MyPiece',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'accessing' }
MyPawn >> id [

	^ 'P'
]

{ #category : 'rendering' }
MyPawn >> renderPieceOn: aSquare [ 
	
	^ aSquare renderPawn: self
]

{ #category : 'rendering' }
MyPawn >> targetSquaresLegal: aBoolean [

	^ (self isWhite
		   ifTrue:  [ { square up. square up } ]
		   ifFalse: [ { square down } ]) select: [ :s |
		  s notNil and: [
			  s hasPiece not or: [ s contents color ~= color ] ] ]
]

{ #category : 'rendering' }
MyPawn >> targetSquaresLegal: aBoolean forPosition: aPosition [ 
    | initialPositions isFirstMove |
    
    "Définir les positions initiales des pions"
    initialPositions := #('a2' 'b2' 'c2' 'd2' 'e2' 'f2' 'g2' 'h2' 'a7' 'b7' 'c7' 'd7' 'e7' 'f7' 'g7' 'h7').
    
    "Vérifier si la position actuelle est une position initiale"
    isFirstMove := initialPositions includes: aPosition.

    "Calculer les mouvements légaux selon la couleur de la pièce"
    ^ (self isWhite
        ifTrue: [
            isFirstMove 
                ifTrue: [ { square up. square up } ] "Déplacement de deux cases vers le haut"
                ifFalse: [ { square up } ] "Déplacement normal"
        ]
        ifFalse: [
            isFirstMove 
                ifTrue: [ { square down. square down  } ] "Déplacement de deux cases vers le bas"
                ifFalse: [ { square down } ] "Déplacement normal"
        ]
    ) select: [ :s |
        s notNil and: [
            s hasPiece not or: [ s contents color ~= color ]
        ]
    ].

]
