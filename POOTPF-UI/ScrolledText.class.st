"
Clase que permite crear un RubScrolledTextMorph de dado tamanio, color y titulo.


Variable definition
header: 		<Morph>
titleMorph: 	<Morph>
sText: 	<RubScrolledTextMorph>
"
Class {
	#name : #ScrolledText,
	#superclass : #Morph,
	#instVars : [
		'header',
		'titleMorph',
		'sText'
	],
	#category : #'POOTPF-UI-Components'
}

{ #category : #creating }
ScrolledText class >> createExtent: dim color: col [
	"Crea un campo de texto scrolleable (con barras de desplazamiento vertical/horizontal) de tamanio y color 	dados"
	|scrolledText|.
	scrolledText := self new.
	scrolledText initializeExtent: dim color: col.
	^scrolledText.
]

{ #category : #creating }
ScrolledText class >> createExtent: dim color: col title: cad [
	"Crea un campo de texto scrolleable (con barras de desplazamiento vertical/horizontal) de tamanio y color 	dados"
	|scrolledText|.
	scrolledText := self new.
	scrolledText initializeExtent: dim color: col title: cad.
	^scrolledText.
]

{ #category : #initialization }
ScrolledText >> addTitle: cad [
	header := Morph new.
	titleMorph := cad asMorph.
	header color: (Color lightGray lighter lighter lighter lighter); borderWidth: 1; borderColor: Color black.
	header width: self width; height: 20; top: self top; left: self left.
	header addMorphCentered: titleMorph.
	"Redimensiona y reposiciona sText por el header agregado"
	sText height: sText height - header height + 1.
	sText top: sText top + header height - 1.
	self addMorph: header.
]

{ #category : #'public accessing' }
ScrolledText >> beReadOnly [
	sText beReadOnly.
]

{ #category : #modifying }
ScrolledText >> changeTitle: cad [
	titleMorph ifNotNil: [  
		titleMorph delete.
		titleMorph := cad asMorph.
		header addMorphCentered: titleMorph
	] ifNil: [  
		self addTitle: cad.
	].
]

{ #category : #'accessing - rulers' }
ScrolledText >> ghostText: cad [
	sText ghostText: cad.
]

{ #category : #initialization }
ScrolledText >> initializeExtent: dim color: col [
	sText := RubScrolledTextMorph new.
	sText extent: dim; color: col; borderColor: Color black; borderWidth: 1.
	self extent: dim; color: Color transparent.
	self addMorphCentered: sText.
]

{ #category : #initialization }
ScrolledText >> initializeExtent: dim color: col title: cad [
	self initializeExtent: dim color: col.
	self addTitle: cad.
]

{ #category : #initialization }
ScrolledText >> setText: cad [
	sText setText: cad.
]
