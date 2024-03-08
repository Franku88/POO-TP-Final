"
Vista que mostrara un menu de creacion de contrato.

Instance Variables
tablaViajesDisponibles: <Table>
tablaFechas:				<Table>
campoCantPersonas:		<TextField>	
campoCantCuotas:		<TextField>
checkFlexible:			<CheckboxButtonMorph>
"
Class {
	#name : #CrearContrato,
	#superclass : #ViewCliente,
	#instVars : [
		'tablaViajesDisponibles',
		'tablaFechas',
		'campoCantPersonas',
		'campoCantCuotas',
		'checkFlexible'
	],
	#category : #'POOTPF-UI-Views'
}

{ #category : #creating }
CrearContrato class >> createWithSystem: unSistema cliente: unCliente [
	|clienteW|.
	clienteW := self new.
	clienteW initializeWithSystem: unSistema cliente: unCliente.
 	^clienteW.
]

{ #category : #adding }
CrearContrato >> addTablaViajesDisponibles [
	"Agrega una tabla de datos de clientes actuales"
	tablaViajesDisponibles  := Table createColumns: (#(Nombre 'Costo por Persona' Impuestos) asOrderedCollection) extent: (body width*(0.5))@(body height*(0.4)) dataSource: (DataSourceViaje createCollection: ((sistema colViajes) select: [:v | v esVigente]) object: sistema).
	tablaViajesDisponibles top: body top + 45; left: body left + 20.
	tablaViajesDisponibles borderColor: Color black; borderWidth: 1.
	body addMorph: tablaViajesDisponibles.
]

{ #category : #initialization }
CrearContrato >> initializeWithSystem: unSistema cliente: unCliente [
	super initializeWithSystem: unSistema cliente: unCliente.
	"Agrega Morphs"
	self addBotonBorrarVentana: 'Atras'.
	self addTablaViajesDisponibles.
	"lo que siga"
]
