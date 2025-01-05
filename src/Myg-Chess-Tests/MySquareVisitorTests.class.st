Class {
	#name : 'MySquareVisitorTests',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MySquareVisitorTests >> testForbiddenMoves [

	| king rook board moves sqVisitor|
	board := MyChessBoard empty.
	board at: 'e8' put: (king := MyKing white).

	"Put attacker just in front of the bishop"
	board at: 'a8' put: (rook := MyRook black).
	
	sqVisitor := MySquareVisitor new.
	moves := sqVisitor checkBlackAttackers: board pieces.

	self
		assertCollection: moves
		includesAll: 
			(#( a1 a2 a3 a4 a5 a6 a7 b8 c8 d8 e8 f8 g8 h8 ) collect: [ :name |
				 board at: name ])
]
