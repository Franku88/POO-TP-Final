"
Vista que mostrara un menu para agregar una excursion opcional a un contrato.
"
Class {
	#name : #AgregarExcursionOpcional,
	#superclass : #ViewContrato,
	#category : #'POOTPF-UI-Views'
}

{ #category : #initialization }
AgregarExcursionOpcional >> initializeWithSystem: unSistema cliente: unCliente contrato: unContrato [
	super initializeWithSystem: unSistema cliente: unCliente contrato: unContrato.
	self addBotonBorrarVentana: 'Atras'.
	self addMessage: 'AGREGAR EXCURSION'.
]
