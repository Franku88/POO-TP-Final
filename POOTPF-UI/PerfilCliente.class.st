"
Vista que muestra datos de un cliente
	cliente:		<Cliente>
"
Class {
	#name : #PerfilCliente,
	#superclass : #Ventana,
	#instVars : [
		'cliente',
		'botonVerContratos',
		'botonIngresarDinero'
	],
	#category : #'POOTPF-UI-Views'
}

{ #category : #accessing }
PerfilCliente >> cliente: unCliente [
	cliente := unCliente.
]

{ #category : #initialization }
PerfilCliente >> initialize [
	super initialize.
	self addContenedor: 250@300.
	
]
