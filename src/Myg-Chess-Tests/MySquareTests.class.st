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

    | chessSquare |
	 chessSquare := MyChessSquare new .
	 chessSquare contents: MyKing white.
	
    self assert: chessSquare contents equals: MyKing white.

]

{ #category : 'tests' }
MySquareTests >> testEmptyContents [

	 | piece chessSquare |
	 piece := MyKing black .
	 chessSquare := MyChessSquare new.
	 chessSquare contents: piece.
    chessSquare emptyContents.
    self assert: chessSquare contents isNil.

]

{ #category : 'tests' }
MySquareTests >> testHasPiece [

    | chessSquare |
	 chessSquare := MyChessSquare new.
    self assert: chessSquare hasPiece equals: false.
    
    


]
