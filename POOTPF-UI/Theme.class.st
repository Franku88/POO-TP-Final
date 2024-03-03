"
Clase que almacena el estilo de los componentes posibles dentro de una ventana.
Los estilos son previamente almacenados en mensajes de instancia. Una vez ejecutado el mensaje, es posible recuperar el estilo de cada componente (paleta de colores y rutas de icono/fondo).

Instance Variables
background:		<Color>
header:		<Color>
logo:		<Morph>
"
Class {
	#name : #Theme,
	#superclass : #Object,
	#instVars : [
		'background',
		'borderButton',
		'borderShape',
		'button1',
		'button2',
		'contrast',
		'header',
		'headerLine',
		'panel',
		'shape',
		'table',
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
	button1 := Color fromString: 'FFFFFF'.
	borderButton := Color fromString: '666666'.
	shape := Color fromString: 'FFFFFF'.
	borderShape := Color fromString: '666666'.
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
