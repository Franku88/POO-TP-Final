"
Vista que mostrara un menu de modificacion de fecha seleccionada para un contrato.

"
Class {
	#name : #CambiarFecha,
	#superclass : #ViewContrato,
	#instVars : [
		'tablaFechas'
	],
	#category : #'POOTPF-UI-Views'
}

{ #category : #adding }
CambiarFecha >> addTablaFechas: unViaje [
	"Agrega una tabla con fechas vigentes de unViaje"
	|label|.
	label := 'Fechas vigentes' asMorph.
	tablaFechas := Table createColumns: (#(Fecha Cupo) asOrderedCollection) extent: ((body width*0.22)@(body height*0.3)) dataSource: (DataSourceFecha createCollection: (unViaje getColFechasVigentesExcepto: (contrato fechaSeleccionada)) object: unViaje).
	
	tablaFechas top: masInfo top; right: masInfo left - 200.
	tablaFechas borderColor: Color black; borderWidth: 1.
	label bottom: tablaFechas top - 10; left: tablaFechas left.
	
	body addMorph: tablaFechas.
	tablaFechas addMorph: label.
	
	tablaFechas setClick: [ :obj |
		obj ifNotNil: [
			"self borrarInputs.
			self addCampoCantPersonas: obj cupo.
			self addCampoCantCuotas.
			self addCheckFlexible.
			self addButtons."
		].	
	].
]

{ #category : #initialization }
CambiarFecha >> initializeWithSystem: unSistema cliente: unCliente contrato: unContrato [
	super initializeWithSystem: unSistema cliente: unCliente contrato: unContrato.
	self addBotonBorrarVentana: 'Atras'.
	self addTablaFechas: (contrato viaje).
]
