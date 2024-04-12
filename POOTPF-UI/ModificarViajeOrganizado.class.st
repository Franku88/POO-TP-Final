"
Vista que muestra menu de modificacion de viaje organizado.

"
Class {
	#name : #ModificarViajeOrganizado,
	#superclass : #ViewViaje,
	#category : #'POOTPF-UI-Views'
}

{ #category : #initialization }
ModificarViajeOrganizado >> initializeWithSystem: unSistema viaje: unViaje [
	super initializeWithSystem: unSistema viaje: unViaje.
	self addTitulo: 'Modificar Viaje Organizado'.
	self addBotonBorrarVentana: 'Atras'.
	"self addButtons."
	
	
]
