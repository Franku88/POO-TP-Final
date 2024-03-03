"
Clase que provee funciones utiles.
"
Class {
	#name : #Helper,
	#superclass : #Object,
	#category : #'POOTPF-UI-Components'
}

{ #category : #creating }
Helper class >> getBorderStyle: color [
	|bStyle|.
	bStyle := RoundedBorder new.
	bStyle color: color.
	bStyle width: 5.
	bStyle cornerRadius: 5.
	^bStyle.
]

{ #category : #creating }
Helper class >> getBorderStyle: color width: w [
	|bStyle|.
	bStyle := RoundedBorder new.
	bStyle color: color.
	bStyle width: w.
	bStyle cornerRadius: 5.
	^bStyle.
]

{ #category : #creating }
Helper class >> getBorderStyle: color width: w radius: r [
	|bStyle|.
	bStyle := RoundedBorder new.
	bStyle color: color.
	bStyle width: w.
	bStyle cornerRadius: r.
	^bStyle.

]

{ #category : #creating }
Helper class >> getFontWithSize: size [
	|font|.
	font := LogicalFont familyName: StandardFonts defaultFont familyName pointSize: size.
	^font.

]

{ #category : #creating }
Helper class >> roundedRectangleExtents: tam color: col borderColor: bColor [
	|rect|.
	rect := Morph new.
	rect extent: tam.
	rect color: col.
	rect borderStyle: (self getBorderStyle: bColor).
	^rect.

]

{ #category : #creating }
Helper class >> roundedRectangleExtents: tam color: col borderColor: bColor borderWidth: bWidth [
	|rect|.
	rect := Morph new.
	rect extent: tam.
	rect color: col.
	rect borderStyle: (self getBorderStyle: bColor width: bWidth).
	^rect.
]

{ #category : #creating }
Helper class >> roundedTable: aTable color: col [
	|rTable|.
	rTable := Morph new.
	rTable extent: (aTable extent + (4@4)).
	rTable color: col.
	rTable borderStyle: (self getBorderStyle: col).
	rTable addMorphCentered: aTable.
	^rTable.	
]

{ #category : #boolean }
Helper class >> stringIsEmpty: cad [
	^(cad trim) isEmpty.

]
