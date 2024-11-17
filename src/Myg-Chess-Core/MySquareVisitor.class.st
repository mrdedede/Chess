"
Class related to the visiting of squares in order to determine the squares that may be threatening the king
"
Class {
	#name : 'MySquareVisitor',
	#superclass : 'Object',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'as yet unclassified' }
MySquareVisitor >> analysedPiece: piece [ 
	|boardPieces forbiddenMoves|
	boardPieces := piece board pieces.
	
	forbiddenMoves := piece color isBlack ifTrue: [ 
		self checkWhiteAttackers: boardPieces.
	] ifFalse: [
		self checkBlackAttackers: boardPieces.
	].
	^forbiddenMoves
]

{ #category : 'as yet unclassified' }
MySquareVisitor >> checkBlackAttackers: pieces [
	|forbiddenMoves|
	forbiddenMoves := { pieces do: [ :piece | piece isWhite ifFalse: [
			piece isKing ifFalse: [ 
				  piece targetSquares.
				]
			]
		]}.
	^ forbiddenMoves
]

{ #category : 'as yet unclassified' }
MySquareVisitor >> checkWhiteAttackers: pieces [
	|forbiddenMoves|
	forbiddenMoves := { pieces do: [ :piece | piece isWhite ifTrue: [
			piece isKing ifFalse: [ 
				  piece targetSquares.
				]
			]
		]}.
	^ forbiddenMoves
]
