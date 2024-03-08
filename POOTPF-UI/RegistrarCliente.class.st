"
Vista que permite realizar el registro de un cliente nuevo al sistema.

Instance Variables

"
Class {
	#name : #RegistrarCliente,
	#superclass : #Ventana,
	#category : #'POOTPF-UI-Views'
}

{ #category : #adding }
RegistrarCliente >> addCampos [

]

{ #category : #initialization }
RegistrarCliente >> initializeWithSystem: sis [
	super initializeWithSystem: sis.
	self addCampos.
	
]
