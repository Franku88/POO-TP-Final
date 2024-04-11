"
Vista que mostrara una tabla con todos los clientes del sistema.

    Instance Variables
	masInfo:		<ScrolledText>
	tablaClientes:		<Table>
	botonEliminar: 		<Button>
"
Class {
	#name : #VerClientes,
	#superclass : #Ventana,
	#instVars : [
		'tablaClientes',
		'masInfo',
		'botonEliminar'
	],
	#category : #'POOTPF-UI-Views'
}

{ #category : #adding }
VerClientes >> addButtons [
	"crear y modificar implementados en ClienteLogin"
	botonEliminar := Button label: 'Eliminar cliente' color: tema container extent: 120@40.
	
	botonEliminar center: tablaClientes center; top: tablaClientes bottom + 50.
	
	botonEliminar mouseAction: [ 
		self addMessageConfirm: ('¿Esta seguro? Se eliminara toda informacion ',String cr,' del cliente (contratos, datos personales, etc).') actionConfirm: [ :popup|
				(sistema bajarClienteConDni: (tablaClientes selectedElement dni)) ifTrue: [
						self addMessage: 'Cliente eliminado con exito' extent: 200@100.
					] ifFalse: [
						self addMessage: 'Ocurrio un problema al eliminar cliente (no encontrado)' extent: 200@100.
					].
				popup delete.
				tablaClientes deselectAll.
			] extent: 270@110.
	].
	
	body addMorph: botonEliminar.
	

]

{ #category : #adding }
VerClientes >> addMasInfo [
	masInfo := ScrolledText createExtent: 350@400 color: (tema container) title: 'Mas informacion'.
	masInfo ghostText: 'Selecciona un cliente de la tabla...'.
	masInfo right: body right - 20.
	masInfo top: tablaClientes top.
	body addMorph: masInfo.
]

{ #category : #adding }
VerClientes >> addTablaClientes [
	"Agrega una tabla de datos de clientes actuales"
	tablaClientes  := Table createColumns: (#(DNI Apellido Ciudad Millas Dinero ) asOrderedCollection) extent: (body width*(0.5))@(body height*(0.6)) dataSource: (DataSourceCliente createCollection: (sistema colClientes) object: sistema).
	tablaClientes top: body top + 45; left: body left + 20.
	tablaClientes borderColor: Color black; borderWidth: 1.
	body addMorph: tablaClientes .
]

{ #category : #initialization }
VerClientes >> initializeWithSystem: unSistema [
	super initializeWithSystem: unSistema.
	self addBotonBorrarVentana: 'Atras'.
	self addTablaClientes.
	self addTitulo: 'Clientes'.
	titulo top: body top + 15; left: tablaClientes left.
	self addMasInfo.
	self addButtons.

	tablaClientes addDependent: self.
	self update: tablaClientes.
]

{ #category : #updating }
VerClientes >> update: o [
	(tablaClientes selectedElement) ifNotNil: [ 
		masInfo setText: (tablaClientes selectedElement) toString.
	] ifNil: [
		masInfo setText: ''.
	].
]
