Class {
	#name : 'MyPawn',
	#superclass : 'MyPiece',
	#instVars : [
		'hasMoved'
	],
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'accessing' }
MyPawn >> captureMoves [ 
    | forwardDirection captureMoves |

    forwardDirection := self forwardDirection.

    "Calcul des cases diagonales pour les captures"
    captureMoves := {
        (self square + (-1 @ forwardDirection)).
        (self square + (1 @ forwardDirection)) }.

    "Filtrer uniquement les cases capturables"
    captureMoves := captureMoves select: [ :s |
        s notNil and: [
            s hasPiece and: [ s contents color ~= self color ] ] ].

    ^ captureMoves

]

{ #category : 'accessing' }
MyPawn >> forwardDirection [ 
    ^ self isWhite
        ifTrue: [ 1 ]
        ifFalse: [ -1 ]

]

{ #category : 'accessing' }
MyPawn >> forwardMoves [ 
    | forwardMoves nextSquare |

    forwardMoves := OrderedCollection new.

    "Vérifie la case directement devant"
    nextSquare := self isWhite
                      ifTrue: [ self square up ]
                      ifFalse: [ self square down ].

    "Ajoute la première case si elle est libre"
    (nextSquare notNil and: [ nextSquare hasPiece not ]) ifTrue: [
        forwardMoves add: nextSquare.

        "Vérifie le double mouvement initial seulement si la première case est libre"
        self hasMoved ifFalse: [
            nextSquare := self isWhite
                              ifTrue: [ nextSquare up ]
                              ifFalse: [ nextSquare down ].
            (nextSquare notNil and: [ nextSquare hasPiece not ]) ifTrue: [
                forwardMoves add: nextSquare ] ] ].

    ^ forwardMoves

]

{ #category : 'accessing' }
MyPawn >> hasMoved [ 
	^ hasMoved 
]

{ #category : 'accessing' }
MyPawn >> hasMoved: aBoolean [ 
	hasMoved := aBoolean 
]

{ #category : 'accessing' }
MyPawn >> id [

	^ 'P'
]

{ #category : 'accessing' }
MyPawn >> initialize [ 
	super initialize.
	hasMoved := false
]

{ #category : 'accessing' }
MyPawn >> moveTo: aSquare [ 
	super moveTo: aSquare.
	hasMoved := true
]

{ #category : 'rendering' }
MyPawn >> renderPieceOn: aSquare [ 
	
	^ aSquare renderPawn: self
]

{ #category : 'rendering' }
MyPawn >> targetSquaresLegal: aBoolean [ 
    | forwardMoves captureMoves |

    "Obtenir les mouvements en avant"
    forwardMoves := self forwardMoves.

    "Obtenir les mouvements de capture"
    captureMoves := self captureMoves.

    
    "Combiner les   mouvements"
    ^ captureMoves , forwardMoves 

]
