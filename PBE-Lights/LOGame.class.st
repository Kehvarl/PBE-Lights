"
I represent the LOGame playing field which will hold LOCells.
"
Class {
	#name : #LOGame,
	#superclass : #BorderedMorph,
	#instVars : [
		'cells'
	],
	#category : #'PBE-Lights'
}

{ #category : #accessing }
LOGame >> cellsPerSide [
	"The number of cells along each side of the game"
	^ 10.
]

{ #category : #initialization }
LOGame >> initialize [ 
	| sampleCell width height n |
	super initialize.
	n := self cellsPerSide.
	sampleCell := LOCell new.
	width := sampleCell width.
	height := sampleCell height.
	self bounds: (5@5 extent: (width * n) @ (height * n) + (2 * self borderWidth)).
	cells := Array2D new: n tabulate: [  :i :j | self newCellAt: i at: j ].
]

{ #category : #initialization }
LOGame >> newCellAt: i at: j [ 
	"Create a cell for position (i, j) and add it to my on-screen 
	representation of the appropriate screen position.
	Answer the new cell."
	
	| c origin |
	c := LOCell new.
	origin := self innerBounds origin .
	self addMorph: c.
	c position: ((i -1) * c width) @ ((j -1) * c height) + origin.
	c mouseAction: [ self toggleNeighborsOfCellAt: i at: j ].
	^ c.
]

{ #category : #accessing }
LOGame >> toggleNeighborsOfCellAt: i at: j [
	i > 1
		ifTrue: [ (cells at: i - 1 at: j) toggleState ].
	i < self cellsPerSide
		ifTrue: [ (cells at: i + 1 at: j) toggleState ].
	j > 1
		ifTrue: [ (cells at: i at: j - 1) toggleState ].
	j < self cellsPerSide
		ifTrue: [ (cells at: i at: j + 1) toggleState ].
]
