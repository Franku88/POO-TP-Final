"
Vista que mostrara una tabla con todos los viajes del sistema.

Instance Variables
tablaViajes:		<Table>
masInfo:		<ScrolledText>

"
Class {
	#name : #VerViajes,
	#superclass : #Ventana,
	#instVars : [
		'tablaViajes',
		'masInfo'
	],
	#category : #'POOTPF-UI-Views'
}

{ #category : #adding }
VerViajes >> addTablaViajes [
	"Agrega una tabla de datos de clientes actuales"
	tablaViajes  := Table createColumns: (#(Nombre 'Costo por Persona' Impuestos) asOrderedCollection) extent: (body width*(0.5))@(body height*(0.4)) dataSource: (DataSourceViaje createCollection: (sistema colViajes) object: sistema).
	tablaViajes top: body top + 45; left: body left + 20.
	tablaViajes borderColor: Color black; borderWidth: 1.
	body addMorph: tablaViajes.
]

{ #category : #initialization }
VerViajes >> initializeWithSystem: unSistema [
	super initializeWithSystem: unSistema .
	self addBotonBorrarVentana: 'Atras'.
	self addTitulo: 'Viajes'.
	self addTablaViajes.
]
