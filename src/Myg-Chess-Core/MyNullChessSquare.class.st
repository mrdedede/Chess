Class {
	#name : 'MyNullChessSquare',
	#superclass : 'MyChessSquare',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'initialization' }
MyNullChessSquare >> initialize [

	super initialize.
	contents := NullPiece new.
	target := BlElement new
		  geometry: BlCircleGeometry new;
		  background: (Color gray alpha: 0.3).

	self layout: BlFrameLayout new.

	label := BlTextElement new.
	label constraintsDo: [ :c | c padding: (BlInsets all: 3) ].

	piece := BlTextElement new.
	piece text: '' asRopedText.
	piece constraintsDo: [ :c |
		c frame horizontal alignCenter.
		c frame vertical alignCenter ].

	self
		addChild: label;
		addChild: piece.
	self
		background: Color white;
		geometry: BlSquareGeometry new.

	self addEventHandlerOn: BlClickEvent do: [ :e | self click ]
	
]

{ #category : 'initialization' }
MyNullChessSquare >> name [

	^'NullSquare'
	
	
]

{ #category : 'accessing' }
MyNullChessSquare >> name: aString [

	name := aString.

]
