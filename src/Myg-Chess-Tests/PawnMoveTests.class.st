Class {
	#name : 'PawnMoveTests',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
PawnMoveTests >> testPawnCanCaptureDiagonally [

	| whitePawn blackPawn board squares |
	board := MyChessBoard empty.
	
	"Placer un pion blanc à sa position de départ, par exemple en e2"
	board at: 'e2' put: (whitePawn := MyPawn white).
	
	"Placer un pion noir sur une case diagonale, par exemple en d3"
	board at: 'd3' put: (blackPawn := MyPawn black).

	"Vérifier que le pion blanc peut capturer le pion noir en d3"
	squares := whitePawn targetSquaresLegal: true.
	self assert: (squares includes: (board at: 'd3')).


]

{ #category : 'tests' }
PawnMoveTests >> testPawnCanMoveOneSquareAfterFirstMove [

	| pawn board squares |
	board := MyChessBoard empty.
	board at: 'e3' put: (pawn := MyPawn white).



	"Vérifier que le pion peut toujours avancer d'une seule case"
	squares := pawn targetSquaresLegal: true.
	self assert: (squares includes: (board at: 'e4')).

]

{ #category : 'tests' }
PawnMoveTests >> testPawnCanMoveOneSquareAfterFirstMove_Black [

	| pawn board squares |
	board := MyChessBoard empty.
	board at: 'e6' put: (pawn := MyPawn black).



	"Vérifier que le pion peut toujours avancer d'une seule case"
	squares := pawn targetSquaresLegal: true.
	self assert: (squares includes: (board at: 'e5')).

]

{ #category : 'tests' }
PawnMoveTests >> testPawnCannotCaptureStraightAhead [

	| whitePawn blackPawn board squares |
	board := MyChessBoard empty.
	
	"Placer un pion blanc en e2"
	board at: 'e2' put: (whitePawn := MyPawn white).
	
	"Placer un pion noir directement devant le pion blanc en e3"
	board at: 'e3' put: (blackPawn := MyPawn black).

	"Vérifier que le pion blanc ne peut pas capturer le pion noir en face de lui"
	squares := whitePawn targetSquaresLegal: true.
	self assert: (squares includes: (board at: 'e3')).


]

{ #category : 'tests' }
PawnMoveTests >> testPawnCannotMoveTwoSquaresAfterFirstMove [

	| pawn board squares |
	board := MyChessBoard empty.
	board at: 'e2' put: (pawn := MyPawn white).

	"Simuler le premier mouvement du pion à 'e3'"
	pawn moveTo: 'e3'.

	"Vérifier que le pion ne peut plus se déplacer de deux cases après son premier mouvement"
	squares := pawn targetSquaresLegal: true.
	self deny: (squares includes: (board at: 'e5')).  "Le pion ne peut pas avancer de deux cases"

]

{ #category : 'tests' }
PawnMoveTests >> testPawnCannotMoveTwoSquaresAfterFirstMove_Black [

	| pawn board squares |
	board := MyChessBoard empty.
	board at: 'e2' put: (pawn := MyPawn black ).

	"Simuler le premier mouvement du pion à 'e3'"
	pawn moveTo: 'e3'.

	"Vérifier que le pion ne peut plus se déplacer de deux cases après son premier mouvement"
	squares := pawn targetSquaresLegal: true.
	self deny: (squares includes: (board at: 'e5')).  "Le pion ne peut pas avancer de deux cases"

]

{ #category : 'tests' }
PawnMoveTests >> testPawnFirstMoveOneSquare [

	| pawn board squares |
	board := MyChessBoard empty.
	board at: 'e2' put: (pawn := MyPawn white).

	"Vérifier que le pion peut se déplacer d'une seule case lors de son premier mouvement"
	squares := pawn targetSquaresLegal: true.
	self assert: (squares includes: (board at: 'e3')).

]

{ #category : 'tests' }
PawnMoveTests >> testPawnFirstMoveTwoSquares [

	| pawn board squares |
	board := MyChessBoard empty.
	board at: 'e2' put: (pawn := MyPawn white).

	"Vérifier que le pion peut se déplacer de deux cases lors de son premier mouvement"
	squares := pawn targetSquaresLegal: true.
	self deny: (squares includes: (board at: 'e4')).

]

{ #category : 'tests' }
PawnMoveTests >> testPawnFirstMoveTwoSquares_Black [

	| pawn board squares |
	board := MyChessBoard empty.
	board at: 'e2' put: (pawn := MyPawn black ).

	"Vérifier que le pion peut se déplacer de deux cases lors de son premier mouvement"
	squares := pawn targetSquaresLegal: true.
	self deny: (squares includes: (board at: 'e4')).

]
