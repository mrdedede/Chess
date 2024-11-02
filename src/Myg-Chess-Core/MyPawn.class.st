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

	| possibleMoves captureMoves forwardDirection nextSquare |
	forwardDirection := self isWhite
		                    ifTrue: [ 1 ]
		                    ifFalse: [ -1 ].

	"Vérifie d'abord la case directement devant"
	nextSquare := self isWhite
		              ifTrue: [ square up ]
		              ifFalse: [ square down ].

	possibleMoves := OrderedCollection new.

	"Ajoute la première case si elle est libre"
	(nextSquare notNil and: [ nextSquare hasPiece not ]) ifTrue: [
		possibleMoves add: nextSquare.

		"Vérifie le double mouvement initial seulement si la première case est libre"
		self hasMoved ifFalse: [
			nextSquare := self isWhite
				              ifTrue: [ nextSquare up ]
				              ifFalse: [ nextSquare down ].
			(nextSquare notNil and: [ nextSquare hasPiece not ]) ifTrue: [
				possibleMoves add: nextSquare ] ] ].

	"Calcul des mouvements de capture"
	captureMoves := {
		                (square + (-1 @ forwardDirection)).
		                (square + (1 @ forwardDirection)) }.

	captureMoves := captureMoves select: [ :s |
		                s notNil and: [
			                s hasPiece and: [ s contents color ~= self color ] ] ].

	^ captureMoves , possibleMoves
]
