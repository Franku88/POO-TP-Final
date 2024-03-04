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
	"Creo empresa/sistema y lo precargo"
	sis := EmpresaTurismo crear.
	TestEmpresa cargaInicial: sis.
	"Inicializo ventana con el sistema creado"
	win initializeWithSystem: sis.
	win openInWindowLabeled: 'FAIBONDI'.
	^win
]

{ #category : #adding }
Home >> addButtons [
	"Agrega boton cliente y boton sistema"
	"Boton Cliente"
	botonCliente := Button text: 'Cliente' extent: 80@30.
	botonCliente  mouseAction: [ 
		"Creo la instancia de ClienteLogin pasandole el sistema, centrado para tapar al anterior morph"
		self addMorphCentered:  (ClienteLogIn initializeWith: sistema).
	].
	"Posicionarlo segun el contenedor"
	botonCliente center: ((contenedor center) - (0@25)).
	contenedor addMorph: botonCliente.		

	"Boton Sistema"
	botonSistema := Button text: 'Sistema' extent: 80@30.
	"botonSistema  mouseAction: [ "
	"Creo la instancia de menu2 pasandole el sistema, lo agrego centrado para que tape al anterior morph"
	"self addMorphCentered:  (MenuCliente initializeWith: sistema) 
	]."
	"Posicionarlo segun el contenedor"
	botonSistema center: ((contenedor center) + (0@25)).
	contenedor addMorph: botonSistema.

	
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
