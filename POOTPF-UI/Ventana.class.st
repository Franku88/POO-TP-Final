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

{ #category : #creating }
Ventana class >> createWithSystem: sis [
	|window|.
	window := self new.
	window initializeWithSystem: sis.
 	^window.
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
	contenedor color: tema container; borderWidth: 1; borderColor: tema containerBorder.
	body addMorph: contenedor.
	
]

{ #category : #adding }
Ventana >> addHeader [
	"Primero se agrega el header a la ventana, luego el body"
	header := Morph new.
	header color: tema header; extent: 800@110; borderWidth: 1; borderColor: Color black.

	"Posiciono logo"
	(tema logo) center: header center.
	(tema logo) right: header right-20.	
	header addMorph: (tema logo).

	self addMorph: header.
	
]

{ #category : #adding }
Ventana >> addMessage: text [
	self addMessage: text extent: 200@100.
]

{ #category : #adding }
Ventana >> addMessage: text extent: dim [
	|popup textM button|.
	"Creo ventana de emergente"
	popup := Morph new.
	popup extent: dim; center: body center; color: tema container; borderWidth: 2; borderColor: Color black.
	
	"Creo texto del popup y lo agrego"
	textM := text asMorph.
	textM center: popup center; top: popup top + 20.
	popup addMorph: textM.
	
	"Creo boton de confirmar y lo agrego"
	button := Button text: 'OK'.
	button center: popup center; bottom: popup bottom - 20.
	button mouseAction: [  
		popup delete.	
	].
	popup addMorph: button.
	
	"Agrego popup al body"
	self addMorph: popup.
	

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
	
	tema := Theme new default.
	self addHeader.
	self addBody.

	
]

{ #category : #initialization }
Ventana >> initializeWithSystem: sis [
	"Inicializacion con sistema"
	self initialize.
	sistema := sis.
	
]
