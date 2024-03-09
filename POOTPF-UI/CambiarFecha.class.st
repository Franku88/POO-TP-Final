"
Vista que mostrara un menu de modificacion de fecha seleccionada para un contrato.

"
Class {
	#name : #CambiarFecha,
	#superclass : #ViewContrato,
	#category : #'POOTPF-UI-Views'
}

{ #category : #initialization }
CambiarFecha >> initializeWithSystem: unSistema cliente: unCliente contrato: unContrato [
	super initializeWithSystem: unSistema cliente: unCliente contrato: unContrato.
	self addBotonBorrarVentana: 'Atras'.
	self addMessage: 'FALTA IMPLEMENTAR'.
]
