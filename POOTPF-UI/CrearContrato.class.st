"
Vista que mostrara un menu de creacion de contrato.
"
Class {
	#name : #CrearContrato,
	#superclass : #ViewCliente,
	#category : #'POOTPF-UI-Views'
}

{ #category : #creating }
CrearContrato class >> createWithSystem: unSistema cliente: unCliente [
	|clienteW|.
	clienteW := self new.
	clienteW initializeWithSystem: unSistema cliente: unCliente.
 	^clienteW.
]

{ #category : #initialization }
CrearContrato >> initializeWithSystem: unSistema cliente: unCliente [
	super initializeWithSystem: unSistema cliente: unCliente.
	"Agrega Morphs"
	self addBotonBorrarVentana: 'Atras'.
	"lo que siga"
]
