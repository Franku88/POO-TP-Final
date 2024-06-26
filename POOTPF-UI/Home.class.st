"
Menu inicial de Faibondi
Instance Variables
botonCliente: 	<Button>
botonSistema 	<Button>

"
Class {
	#name : #Home,
	#superclass : #Ventana,
	#instVars : [
		'botonCliente',
		'botonSistema'
	],
	#category : #'POOTPF-UI-Views'
}

{ #category : #adding }
Home >> addButtons [
	"Agrega boton cliente y boton sistema"
	"Boton Cliente"
	botonCliente := Button label: 'Cliente' extent: 80@30.
	botonCliente  mouseAction: [ 
		"Creo la instancia de ClienteLogin pasandole el sistema, centrado para tapar al anterior morph"
		self addMorphCentered:  (ClienteLogIn createWithSystem: sistema).
	].
	"Posicionarlo segun el contenedor"
	botonCliente center: ((contenedor center) - (0@25)).
	contenedor addMorph: botonCliente.		

	"Boton Sistema"
	botonSistema := Button label: 'Sistema' extent: 80@30.
	botonSistema  mouseAction: [ 
	"Creo la instancia otra ventana pasandole el sistema, lo agrego centrado para que tape al anterior morph"
		self addMorphCentered:  (SistemaLogIn createWithSystem: sistema).
	].
	"Posicionarlo segun el contenedor"
	botonSistema center: ((contenedor center) + (0@25)).
	contenedor addMorph: botonSistema.

	
]

{ #category : #initialization }
Home >> initializeWithSystem: sis [
	"super para aplicar las config de superclase"
	super initializeWithSystem: sis.	
	"Crea el contenedor para los botones"
	self addContenedor: 200@200.
	"Agrega botones"
	self addButtons.
	"Agrega titulo sobre contenedor"
	self addTitulo: 'Bienvenido a FAIBONDI©'.
]
