Class {
	#name : #VerClientes,
	#superclass : #Ventana,
	#instVars : [
		'tablaDeDatos',
		'masInfo',
		'clienteSeleccionado',
		'cliente'
	],
	#category : #'POOTPF-UI-Views'
}

{ #category : #adding }
VerClientes >> addTablaClientes [
	"Agrega una tabla de datos de clientes actuales"
		tablaDeDatos  := Table createColumns: (#(DNI Apelledio Ciudad Millas Dinero ) asOrderedCollection) extent: (body width*(0.6))@(body height*(0.7)) dataSource: (DataSourceCliente createCollection: (sistema colClientes) object: sistema).
		tablaDeDatos  top: body top + 45; left: body left + 20.
		tablaDeDatos  borderColor: Color black; borderWidth: 1.
		tablaDeDatos  setClick: [:index |
			clienteSeleccionado := (tablaDeDatos  elementAt: index).
			self update: tablaDeDatos .
	 	].
		body addMorph: tablaDeDatos .
]

{ #category : #initialization }
VerClientes >> initialize [ 
super initialize .
self addBotonBorrarVentana: 'atras'.
self addTitulo: 'Clientes'.
self addTablaClientes.
]

{ #category : #initialization }
VerClientes >> initializeWithSystem: unSistema [
self initialize .
self initializeWithSystem: unSistema .
self addBotonBorrarVentana: 'atras'.
self addTitulo: 'Clientes'.
self addTablaClientes.
]
