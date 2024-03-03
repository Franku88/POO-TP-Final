"
Clase que almacena el estilo de los componentes posibles dentro de una ventana.
Los estilos son previamente almacenados en mensajes de instancia. Una vez ejecutado el mensaje, es posible recuperar el estilo de cada componente (paleta de colores y rutas de icono/fondo).

Instance Variables
background:		<Object>
borderButton:		<Color>
borderShape:		<Color>
button1:		<Button>
button2:		<Button>
contrast:		<Color>
header:		<Color>
headerLine:		<Color>
icon:		<Color>
iconColor:		<Color>
panel:		<Color>
shape:		<Color>
table:		<Color>
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
		'icon',
		'iconColor',
		'panel',
		'shape',
		'table'
	],
	#category : #'POOTPF-UI-Components'
}

{ #category : #accessing }
Theme >> background [
	^background
]

{ #category : #constants }
Theme >> backgroundPath [
	"Asigna ruta del banner de fondo"
	"background := 'pharo-local/iceberg/franco-benitez/POO-TPFinal/resources/background1.jpg'."
]

{ #category : #accessing }
Theme >> borderButton [
	^borderButton.
]

{ #category : #accessing }
Theme >> borderShape [
	^borderShape.
]

{ #category : #accessing }
Theme >> button1 [
	^button1
]

{ #category : #accessing }
Theme >> button2 [
	^button2.
]

{ #category : #accessing }
Theme >> contrast [
	^contrast.
]

{ #category : #constants }
Theme >> default [
	button1 := Color fromString: 'FFFFFF'.
	borderButton := Color fromString: '666666'.
	shape := Color fromString: 'FFFFFF'.
	borderShape := Color fromString: '666666'.
	background := Color fromString: 'FFFFFF'.
	header := Color fromString: 'FFFFFF'.
]

{ #category : #accessing }
Theme >> header [
	^header.
]

{ #category : #accessing }
Theme >> headerLine [
	^headerLine.
]

{ #category : #accessing }
Theme >> icon [
	^icon
]

{ #category : #accessing }
Theme >> iconColor [
	^iconColor
]

{ #category : #constants }
Theme >> iconPath [
	"icon := 'pharo-local/iceberg/franco-benitez/POO-TPFinal/resources/icon.png'"
]

{ #category : #initialization }
Theme >> initialize [
	self default.
]

{ #category : #accessing }
Theme >> panel [
	^panel.
]

{ #category : #accessing }
Theme >> shape [
	^shape.
]

{ #category : #accessing }
Theme >> table [
	^table.
]
