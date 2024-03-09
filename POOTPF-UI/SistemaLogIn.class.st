"
Menu de ingreso del sistema.

    Instance Variables
	botonClientes:		<Object>
	botonResumen:		<Object>
	botonViajes:		<Object>
"
Class {
	#name : #SistemaLogIn,
	#superclass : #Ventana,
	#instVars : [
		'botonViajes',
		'botonClientes',
		'botonResumen'
	],
	#category : #'POOTPF-UI-Views'
}

{ #category : #adding }
SistemaLogIn >> addButtons [ 
	botonResumen := Button label: 'Resumen Diario' extent: 100@30.
	botonViajes := Button label:'Viajes' extent: 80@30.
	botonClientes := Button label:'Clientes' extent: 80@30.
	"ubico boton clientes"
	botonClientes center:contenedor center.
	contenedor addMorph: botonClientes .
	"ubico boton viajes"
	botonViajes center:contenedor center.
	botonViajes top:contenedor top+25.
	contenedor  addMorph: botonViajes .
	"ubico boton resumenes"
	botonResumen center: contenedor center.
	botonResumen bottom: contenedor bottom-25.
	contenedor addMorph: botonResumen  .
	botonResumen mouseAction: [ 
			"Creo la instancia de ClienteLogin pasandole el sistema, centrado para tapar al anterior morph"
			self addMorphCentered:  (ResumenDiario  createWithSystem: sistema) 
		].
	botonClientes  mouseAction: [ 
			"Creo la instancia de ClienteLogin pasandole el sistema, centrado para tapar al anterior morph"
			self addMorphCentered:  (VerClientes  createWithSystem: sistema) 
		].
	botonViajes   mouseAction: [ 
			"Creo la instancia de ClienteLogin pasandole el sistema, centrado para tapar al anterior morph"
			self addMorphCentered:  (VerViajes  createWithSystem: sistema) 
		].
]

{ #category : #initialization }
SistemaLogIn >> initializeWithSystem: sis [ 
	super initializeWithSystem: sis .
	self addBotonBorrarVentana: 'Volver'.
	self addContenedor: 200@200.
	self addButtons .
]
