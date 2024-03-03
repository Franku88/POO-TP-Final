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
	win := self new.
	sis := 'ALGO'.
	win initializeWithSystem: sis.
	win openInWindowLabeled: 'FAIBONDI'.
	^win
]

{ #category : #adding }
Home >> addButtons [ 
	"botones"
	botonCliente := Button text: 'Cliente' extent: 80@30.
	"Agrego funcion a botonCliente"
	botonCliente  mouseAction: [ 
		"Creo la instancia de ClienteLogin pasandole el sistema, lo agrego centrado para que tape al anterior morph"
		self addMorphCentered:  (ClienteLogIn initializeWith: sistema) 
	].

	"posicionarlo segun el contenedor"
	botonCliente center: ((contenedor center) - (0@25)).
	contenedor addMorph: botonCliente.	

	

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
	"Agrega titulo sobre contenedor"
	self addTitulo: 'Bienvenido a FAIBONDI©'.
]
