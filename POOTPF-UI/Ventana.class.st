"
Instance Variables
sistema:		<Object>
tema:		<Theme>
header:	<Morph>
body:		<Morph>
logo: 	 	<Form>
titulo: 	<String>
vistaAnterior: <Ventana>
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
		'logo',
		'titulo'
	],
	#category : #'POOTPF-UI-Views'
}

{ #category : #initialization }
Ventana class >> initializeWith: sis [
	|window|.
	window := self new.
	window initializeWithSystem: sis.
 	^ window.
]

{ #category : #adding }
Ventana >> addBody [
	"Body agregado luego del header, ya que sus dimensiones estan relacionadas"
	body := Morph new.
	body color: tema background.
	"Dejo lugar para header"
	body position: (0@(header height)).
	body extent: 800@(600 - (header height)); borderWidth: 1; borderColor: Color black.
	self addMorph: body.
]

{ #category : #adding }
Ventana >> addBotonAtras: etiqueta [
	|boton|.
	boton := Button text: etiqueta extent: 80@30.
	boton center: header center.
	boton left: header left+30.
	boton mouseAction: [ 
		self delete 
	].
	header addMorph: boton.
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

	"Posiciono logo"
	(tema logo) center: header center.
	(tema logo) right: header right-10.	
	header addMorph: (tema logo).

	self addMorph: header.
	
]

{ #category : #adding }
Ventana >> addTitulo: unString [
	titulo := unString asMorph.
	titulo center: (body center).
	titulo top: ((contenedor top + body top)/2); color: Color black.
	body addMorph: titulo.
	
	
]

{ #category : #initialization }
Ventana >> initialize [
	"Inicializa ventana sin sistema"
	super initialize.
	self extent: 800@600.
	self color: Color transparent.
	
	tema := Theme new defaultWLogo.
	self addHeader.
	self addBody.

	
]

{ #category : #initialization }
Ventana >> initializeWithSystem: sis [
	"Inicializacion con sistema"
	self initialize.
	sistema := sis.
	
]
