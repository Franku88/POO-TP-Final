"
Instance Variables
sistema:		<Object>
tema:		<Theme>
header:	<Morph>
body:		<Morph>
logo: 	 	<Form>
"
Class {
	#name : #Ventana,
	#superclass : #BorderedMorph,
	#instVars : [
		'sistema',
		'tema',
		'header',
		'body',
		'botonAtras',
		'contenedor',
		'logo'
	],
	#category : #'POOTPF-UI-Views'
}

{ #category : #operations }
Ventana class >> initializeWith: sis [
	|win|.
	win := self new.
	win initializeSystem: sis.
	^win.
]

{ #category : #adding }
Ventana >> addBody [
	"Body agregado luego del header, ya que sus dimensiones estan relacionadas"
	|bod|.
	bod := Morph new.
	bod color: tema background.
	"Dejo lugar para header"
	bod position: (0@(header height)).
	bod extent: 800@(600 - (header height)); borderWidth: 1; borderColor: Color black.
	self addMorph: bod.
	body := bod.
]

{ #category : #adding }
Ventana >> addBotonAtras: etiqueta [
	|boton|.
	boton := Button text: etiqueta extent: 80@30.
	boton center: header center.
	boton left: header left+30.
	self addMorph: boton.
]

{ #category : #adding }
Ventana >> addContenedor: dim [
	contenedor := Morph new.
	contenedor extent: dim.
	contenedor center: body center.
	contenedor color: (Color fromString: 'DAE8FC'); borderWidth: 1; borderColor: (Color fromString: '6C8EBF').
	body addMorph: contenedor.
	
]

{ #category : #adding }
Ventana >> addHeader [
	"Primero se agrega el header a la ventana, luego el body"
	header := Morph new.
	header color: tema header; extent: 800@110; borderWidth: 1; borderColor: Color black.

	"Logo cargado desde el directorio"
	logo := (Form fromFileNamed: tema logoPath) asMorph.
	"Posiciono logo"
	logo center: header center.
	logo right: header right-10.
	
	header addMorph: logo.

	self addMorph: header.
	
]

{ #category : #initialization }
Ventana >> initialize [
	"Inicializa ventana sin sistema"
	super initialize.
	self extent: 800@600.
	self color: Color transparent.
	
	tema := Theme new default.
	self addHeader.
	self addBody.

	
]

{ #category : #initialization }
Ventana >> initializeSystem: sis [
	"Inicializacion con sistema"
	self initialize.
	sistema := sis.
	
]
