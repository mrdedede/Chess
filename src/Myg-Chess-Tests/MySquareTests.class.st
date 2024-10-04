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
MySquareTests >> testChessSquareCreation [
   | chessSquare |
   chessSquare := MyChessSquare new.   
 	self assert: chessSquare notNil.

]

{ #category : 'tests' }
MySquareTests >> testContents [ 

	|square piece board|
	board := MyChessBoard empty.
	square := MyChessSquare new.
	square := board at: 'e4'.
	piece := MyPawn white .
	square contents: piece .

	self assert: square contents equals: piece.
]

{ #category : 'tests' }
MySquareTests >> testEmptyContents [ 

	|square piece board|
	board := MyChessBoard empty.
	square := MyChessSquare new.
	square := board at: 'e4'.
	piece := MyPawn white .
	square contents: piece .
	square emptyContents .

	self assert: square contents equals: nil.
]

{ #category : 'tests' }
MySquareTests >> testHasPiece [ 

	|square piece board|
	board := MyChessBoard empty.
	square := MyChessSquare new.
	square := board at: 'e4'.
	piece := MyPawn white .
	square contents: piece .
	square hasPiece .

	self deny: square contents equals: nil.
]
