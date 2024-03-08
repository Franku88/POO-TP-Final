"
Vista que mostrara un menu de creacion de contrato.

Instance Variables
tablaViajesDisponibles: <Table>
tablaFechas:				<Table>
campoCantPersonas:		<TextField>	
campoCantCuotas:		<TextField>
checkFlexible:			<CheckboxButtonMorph>
botonCrear: 				<Button>
"
Class {
	#name : #CrearContrato,
	#superclass : #ViewCliente,
	#instVars : [
		'tablaViajesDisponibles',
		'tablaFechas',
		'campoCantPersonas',
		'campoCantCuotas',
		'checkFlexible',
		'botonCrear'
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
CrearContrato >> addBotonCrearContrato [
	botonCrear := Button label: 'Crear contrato' extent: 100@35.
	botonCrear center: body center; bottom: body bottom - 40.
	
	botonCrear mouseAction: [ 
		cliente generarContrato: ((sistema getColContratos) size + 1) viaje: (tablaViajesDisponibles selectedElement) fechaSalida: (tablaFechas selectedElement) cantPasajeros: (campoCantPersonas getValor) cantCuotas: (campoCantCuotas getValor) esFlexible: (checkFlexible enabled).
		self addMessage: 'Contrato creado con exito.'.
	].

	self addMorph: botonCrear.
]

{ #category : #adding }
CrearContrato >> addButtons [
	self addBotonCrearContrato.
	
]

{ #category : #adding }
CrearContrato >> addCampoCantCuotas [
	|title|.
	campoCantCuotas := MenuSelectInt createBetween: 1 and: 24.
	title := 'Cantidad de Cuotas' asMorph.
	
	campoCantCuotas bottom: (tablaFechas bottom - 20).		
	campoCantCuotas left: (tablaFechas right + 50).
	
	title center: campoCantCuotas center.
	title left: campoCantCuotas right + 30.
	
	campoCantCuotas addMorph: title.
	body addMorph: campoCantCuotas. 
]

{ #category : #adding }
CrearContrato >> addCampoCantPersonas: max [
	"Max es la cantidad de personas maximas para dicho viaje"
	|title|
	campoCantPersonas := MenuSelectInt createBetween: 1 and: max.
	title := 'Cantidad de Personas' asMorph.
	
	campoCantPersonas top: (tablaFechas  top + 20).	
	campoCantPersonas left: (tablaFechas right + 50).
	
	title center: campoCantPersonas center.
	title left: campoCantPersonas right + 30.
	
	campoCantPersonas addMorph: title.
	body addMorph: campoCantPersonas.

]

{ #category : #adding }
CrearContrato >> addCheckFlexible [
	"CONTINUAR"
	|title|.
	checkFlexible := CheckboxButtonMorph checkBox.
	title := 'Contrato Flexible' asMorph.
	
	checkFlexible center: (tablaFechas  center).	
	checkFlexible left: (tablaFechas right + 55).
	title center: checkFlexible center.
	title left: checkFlexible right + 10.
	
	body addMorph: checkFlexible.
	
	
	
	
	
	campoCantPersonas addMorph: title.
	body addMorph: campoCantPersonas.

]

{ #category : #adding }
CrearContrato >> addTablaFechas: unViaje [
	"Agrega una tabla con fechas vigentes de unViaje"
	tablaFechas := Table createColumns: (#(Fecha Cupo) asOrderedCollection) extent: ((body width*0.22)@(body height*0.3)) dataSource: (DataSourceFecha createCollection: (unViaje getColFechasVigentes) object: unViaje).
	
	tablaFechas top: tablaViajesDisponibles  bottom + 20; left: tablaViajesDisponibles left.
	tablaFechas borderColor: Color black; borderWidth: 1.
	
	body addMorph: tablaFechas.
	
	tablaFechas setClick: [ :obj |
		obj ifNotNil: [
			self borrarInputs.
			self addCampoCantPersonas: obj cupo.
			self addCampoCantCuotas.
			self addCheckFlexible.
			self addButtons.
		].	
	].
]

{ #category : #adding }
CrearContrato >> addTablaViajesDisponibles [
	"Agrega una tabla de datos de clientes actuales"
	tablaViajesDisponibles  := Table createColumns: (#(Nombre 'Costo por Persona' Impuestos) asOrderedCollection) extent: (body width*(0.5))@(body height*(0.4)) dataSource: (DataSourceViaje createCollection: ((sistema colViajes) select: [:v | v esVigente]) object: sistema).
	
	tablaViajesDisponibles center: body center.
	tablaViajesDisponibles top: body top + 20.
	tablaViajesDisponibles borderColor: Color black; borderWidth: 1.
	
	body addMorph: tablaViajesDisponibles.
]

{ #category : #deleting }
CrearContrato >> borrarInputs [
		campoCantPersonas ifNotNil: [
			campoCantPersonas delete.
		].
		campoCantCuotas ifNotNil: [
			campoCantCuotas delete.
		].
		checkFlexible ifNotNil: [
			checkFlexible delete.
		].
]

{ #category : #initialization }
CrearContrato >> initializeWithSystem: unSistema cliente: unCliente [
	super initializeWithSystem: unSistema cliente: unCliente.
	"Agrega Morphs"
	self addBotonBorrarVentana: 'Atras'.
	self addTablaViajesDisponibles.
	tablaViajesDisponibles addDependent: self.
	self update: tablaViajesDisponibles selectedElement.
]

{ #category : #updating }
CrearContrato >> update: o [
	(tablaViajesDisponibles selectedElement) ifNotNil: [
		tablaFechas ifNotNil:[
			tablaFechas delete.
			self borrarInputs.
		].
		self addTablaFechas: (tablaViajesDisponibles selectedElement).
	].
]
