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
    | possibleMoves captureMoves forwardDirection |
    
    forwardDirection := self isWhite ifTrue: [ 1 ] ifFalse: [ -1 ].
    
    possibleMoves := self isWhite
        ifTrue: [
            self hasMoved
                ifTrue: [ { square up } ]
                ifFalse: [ { square up. square up up } ] ]
        ifFalse: [
            self hasMoved
                ifTrue: [ { square down } ]
                ifFalse: [ { square down. square down down } ] ].
    
    captureMoves := { 
        square + (-1 @ forwardDirection).
        square + (1 @ forwardDirection)
    }.
    
    possibleMoves := possibleMoves select: [ :s |
        s notNil and: [ s hasPiece not ] ].
    
    captureMoves := captureMoves select: [ :s |
        s notNil and: [ s hasPiece and: [ s contents color ~= self color ] ] ].
    
    ^ captureMoves, possibleMoves select: [ :s |
        s notNil and: [ s hasPiece not or: [ s contents color ~= self color ] ] ]
]
