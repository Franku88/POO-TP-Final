"
Vista que mostrara una tabla con todos los viajes del sistema.

Instance Variables
tablaViajes:		<Table>
masInfo:		<ScrolledText>

"
Class {
	#name : #VerViajes,
	#superclass : #Ventana,
	#category : #'POOTPF-UI-Views'
}

{ #category : #adding }
VerViajes >> addTablaViajes [
	
]

{ #category : #initialization }
VerViajes >> initializeWithSystem: unSistema [
	super initializeWithSystem: unSistema .
	self addBotonBorrarVentana: 'Atras'.
	self addTitulo: 'Viajes'.
	self addTablaViajes.
]
