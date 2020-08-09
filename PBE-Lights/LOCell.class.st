"
I represent a Cell for Lights-Out

I am either On or Off and when toggled switch the 4 orthoganal Cells.

"
Class {
	#name : #LOCell,
	#superclass : #SimpleSwitchMorph,
	#instVars : [
		'mouseAction'
	],
	#category : #'PBE-Lights'
}

{ #category : #initialization }
LOCell >> initialize [
	super initialize.
	self label: ''.
	self borderWidth: 2.
	bounds := 0@0 corner: 16@16.
	offColor := Color paleYellow .
	onColor := Color paleBlue darker.
	self useSquareCorners .
	self turnOff.
]

{ #category : #accessing }
LOCell >> mouseAction: aBlockClosure [ 
	mouseAction := aBlockClosure
]

{ #category : #'event handling' }
LOCell >> mouseUp: anEvent [
	mouseAction value.
]
