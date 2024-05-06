"
Vista para crear viaje organizado
<Instance Variables>
"
Class {
	#name : #CrearViajeOrganizado,
	#superclass : #Ventana,
	#category : #'POOTPF-UI-Views'
}

{ #category : #initialization }
CrearViajeOrganizado >> initializeWithSystem: sis [
	super initializeWithSystem: sis.
	self addBotonBorrarVentana: 'Volver'.
	self addTitulo: 'Creando Viaje Organizado'
]
