Class {
	#name : 'MySquareTests',
	#superclass : 'TestCase',
	#classVars : [
		'MyChessPiece'
	],
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MySquareTests >> testBoard [ 

	| board square |
	board := MyChessBoard empty.
	square := MyChessSquare new.
	square board: board.

	self assert: square board isNotNil .
]

{ #category : 'tests' }
MySquareTests >> testCaseIsEmpty [

    | chessSquare |
	 chessSquare := MyChessSquare new.
    self assert: chessSquare hasPiece equals: false.
    
    


]

{ #category : 'tests' }
MySquareTests >> testCaseIsNotEmpty [

    | chessSquare |
	 chessSquare := MyChessSquare new.
    self assert: chessSquare hasPiece equals: true.
    
    


]

{ #category : 'tests' }
MySquareTests >> testChessSquareCreation [
   | chessSquare |
   chessSquare := MyChessSquare new.   
 	self assert: chessSquare notNil.

]

{ #category : 'tests' }
MySquareTests >> testContents [ 

	|square piece|
	square := MyChessSquare new.
	piece := MyPawn new.
	square contents: piece.

	self assert: square contents equals: piece.
]
