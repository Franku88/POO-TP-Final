"
Menu inicial de Faibondi
"
Class {
	#name : #Home,
	#superclass : #Ventana,
	#instVars : [
		'botonCliente',
		'botonSistema',
		'contenedorBotones'
	],
	#category : #'POOTPF-UI-Views'
}

{ #category : #operations }
Home class >> create [
	|sis win|.
	
	sis := 'ALGO'.
	win := self new.
	win initializeSystem: sis.
	win openInWindowLabeled: 'FAIBONDI'.
	^win
	
	
]

{ #category : #adding }
Home >> addButtons [ 
	"botones"
	botonCliente := Button text: 'Cliente' extent: 80@30.

	"posicionarlo segun el contenedor"
	botonCliente center: ((contenedor center) - (0@25)).
	contenedor addMorph: botonCliente .

	"botonCliente  mouseAction: [ "
	"Creo la instancia de menu2 pasandole el sistema, lo agrego centrado para que tape al anterior morph"
	"self addMorphCentered:  (MenuCliente initializeWith: sistema) 
	]"

	botonSistema := Button text: 'Sistema' extent: 80@30.

	"posicionarlo segun el contenedor"
	botonSistema center: ((contenedor center) + (0@25)).
	contenedor addMorph: botonSistema.

	"botonSistema  mouseAction: [ "
	"Creo la instancia de menu2 pasandole el sistema, lo agrego centrado para que tape al anterior morph"
	"self addMorphCentered:  (MenuCliente initializeWith: sistema) 
	]"
	
]

{ #category : #initialization }
Home >> initialize [ 
	"super para aplicar las config de superclase"
	super initialize.

	"Crea el contenedor para los botones"
	self addContenedor: 200@200.
	"Agrega botones"
	self addButtons.
	self addBotonAtras: 'Volver'.
	self addTitulo: 'Bienvenido a FAIBONDI©'
]
