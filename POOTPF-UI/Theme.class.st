"
Clase que almacena paleta de colores y logo a utilizar en Ventanas.

Instance Variables
header:		<Color>
background:	<Color>
container: 	<Color>
containerBorder: <Color>
logo:		<Morph>

 
"
Class {
	#name : #Theme,
	#superclass : #Object,
	#instVars : [
		'background',
		'header',
		'logo',
		'container',
		'containerBorder'
	],
	#category : #'POOTPF-UI-Components'
}

{ #category : #accessing }
Theme >> background [
	^background
]

{ #category : #accessing }
Theme >> container [
	^container.
]

{ #category : #accessing }
Theme >> containerBorder [
	^containerBorder.
]

{ #category : #constants }
Theme >> default [
	background := Color fromString: 'FFFFFF'.
	header := Color fromString: 'FFFFFF'.
	container:= Color fromString: 'DAE8FC'.
	containerBorder := Color fromString: '6C8EBF'.
	logo := ('FAIBONDI©' asMorph) color: Color black.

]

{ #category : #constants }
Theme >> defaultWLogo [
	self default.
	logo := (Form fromFileNamed: 'pharo-local/iceberg/POO-TP-Final/resources/faibondilogo.png') asMorph.
]

{ #category : #accessing }
Theme >> header [
	^header.
]

{ #category : #initialization }
Theme >> initialize [
	self default.
]

{ #category : #accessing }
Theme >> logo [
	^logo
]
