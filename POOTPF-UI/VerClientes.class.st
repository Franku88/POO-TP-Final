"
Vista que mostrara una tabla con todos los clientes del sistema.

    Instance Variables
	masInfo:		<ScrolledText>
	tablaClientes:		<Table>
"
Class {
	#name : #VerClientes,
	#superclass : #Ventana,
	#instVars : [
		'tablaClientes',
		'masInfo'
	],
	#category : #'POOTPF-UI-Views'
}

{ #category : #adding }
VerClientes >> addTablaClientes [
	"Agrega una tabla de datos de clientes actuales"
	tablaClientes  := Table createColumns: (#(DNI Apellido Ciudad Millas Dinero ) asOrderedCollection) extent: (body width*(0.6))@(body height*(0.7)) dataSource: (DataSourceCliente createCollection: (sistema colClientes) object: sistema).
	tablaClientes top: body top + 45; left: body left + 20.
	tablaClientes borderColor: Color black; borderWidth: 1.
	body addMorph: tablaClientes .
]

{ #category : #initialization }
VerClientes >> initializeWithSystem: unSistema [
	super initializeWithSystem: unSistema .
	self addBotonBorrarVentana: 'Atras'.
	self addTitulo: 'Clientes'.
	self addTablaClientes.
]
