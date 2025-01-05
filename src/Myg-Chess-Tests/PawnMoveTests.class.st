Class {
	#name : 'PawnMoveTests',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
PawnMoveTests >> testEnPassantCapture [
    | game whitePawn blackPawn originalSquare enPassantSquare |
    game := MyChessGame freshGame.

    "on récupère les pions concernés"
    whitePawn := game pieces detect: [ :p | p isPawn and: [ p square name = 'e2' ] ].
    blackPawn := game pieces detect: [ :p | p isPawn and: [ p square name = 'd7' ] ].

    "on fait avancer le pion blanc de e2 à e5"
    game move: whitePawn to: whitePawn square up up.
    game move: whitePawn to: whitePawn square up.
    originalSquare := whitePawn square.

    "on fait  avancer le pion noir de deux cases (d7 à d5)"
    game move: blackPawn to: blackPawn square down down.
    enPassantSquare := blackPawn square up. "Case cible en passant (d6)"

    "on vérifie que la capture en passant est possible"
    self assert: (whitePawn enPassantTargetSquares includes: enPassantSquare).

    "on essaie de capturer en passant (e5 prend d6)"
    game move: whitePawn to: enPassantSquare.

    "Vérifications"
    self assert: whitePawn square equals: enPassantSquare. "Le pion blanc doit être sur d6"
    self deny: originalSquare hasPiece. "e5 doit être maintenant vide"
    self deny: blackPawn square hasPiece. "Le pion noir doit être capturé"

]

{ #category : 'tests' }
PawnMoveTests >> testFirstMove [ 
	| game pawn startSquare targetSquare1 targetSquare2 |
	game := MyChessGame freshGame.
	pawn := game pieces detect: [ :p | p isPawn and: [ p square name = 'e2' ] ].

	"Mouvement initial d'une case"
	startSquare := pawn square.
	targetSquare1 := startSquare up.
	game move: pawn to: targetSquare1.
	self assert: pawn square equals: targetSquare1.
	self deny: startSquare hasPiece.

	"Réinitialiser pour tester mouvement initial de deux cases"
	game := MyChessGame freshGame.
	pawn := game pieces detect: [ :p | p isPawn and: [ p square name = 'e2' ] ].

	"Mouvement initial de deux cases"
	startSquare := pawn square.
	targetSquare2 := startSquare up up.
	game move: pawn to: targetSquare2.
	self assert: pawn square equals: targetSquare2.
	self deny: startSquare hasPiece.
]

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
PawnMoveTests >> testPawnCannoJumpOut_Of_anotherPawn_In_theFirst_move [
	| pawn board squares |
	board := MyChessBoard empty.
	board at: 'e2' put: (pawn := MyPawn white).
   board at: 'e3' put: (pawn := MyPawn black ).

	"Simuler le premier mouvement du pion à 'e4'"
	pawn moveTo: 'e4'.

	"Vérifier que le pion ne peut plus sauter au dessu dun autre pion dans le premier move"
	squares := pawn targetSquaresLegal: true.
	self deny: (squares includes: (board at: 'e4')). 

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

	| pawn board squares e4Square |
	
	"Créer un plateau de jeu vide"
	board := MyChessBoard empty.
	
	"Placer un pion noir sur e7"
	board at: 'e7' put: (pawn := MyPawn black).
	
	"Récupérer la case e5 pour vérification"
	e4Square := board at: 'e5'.
	
	"Vérifier que le pion noir ne peut pas se déplacer de deux cases vers e5"
	squares := pawn targetSquaresLegal: true.
	
	"Le pion noir ne peut pas atteindre e5 (vérification négative)"
	self deny: (squares includes: e4Square).

]
