"
Vista que mostrara un menu para agregar una excursion opcional a un contrato.
"
Class {
	#name : #AgregarExcursionOpcional,
	#superclass : #ViewContrato,
	#instVars : [
		'tablaExcursiones',
		'campoCantPersonas',
		'botonAgregarExcursion'
	],
	#category : #'POOTPF-UI-Views'
}

{ #category : #adding }
AgregarExcursionOpcional >> addBotonAgregarExcursion [
	botonAgregarExcursion := Button label: 'Agregar excursion' extent: 125@35.
	botonAgregarExcursion center: tablaExcursiones center; top: tablaExcursiones bottom + 75.
	
	botonAgregarExcursion mouseAction: [	
			self addMessageConfirm: ('¿Esta seguro? Se cobraran $',((tablaExcursiones selectedElement costoPorPersona)*(campoCantPersonas getValor)) asString) 
			actionConfirm: ([:popup|
				(contrato agregarReserva: (tablaExcursiones selectedElement) cantPersonas: (campoCantPersonas getValor)) ifTrue: [
					self addMessage: 'Excursion agregada'.
					tablaExcursiones delete.
					self addTablaExcursiones: (contrato viaje).
				] ifFalse: [
					self addMessage: 'Hubo un error (contratado o no personas disponibles)'.
				].
				popup delete.
				"self borrarInputs."
			]) extent: 200@100.
	].
	self addMorph: botonAgregarExcursion.
]

{ #category : #adding }
AgregarExcursionOpcional >> addButtons [
	self addBotonAgregarExcursion.
]

{ #category : #adding }
AgregarExcursionOpcional >> addCampoCantPersonas [
	"Max es la cantidad de personas maximas para dicho viaje"
	|title|
	campoCantPersonas := MenuSelectInt createBetween: 1 and: (contrato calcularPersonasSinReserva).
	title := 'Cantidad de Personas' asMorph.
	
	campoCantPersonas top: (tablaExcursiones bottom + 20).	
	campoCantPersonas left: (tablaExcursiones left + 20).
	
	title center: campoCantPersonas center.
	title left: campoCantPersonas right + 30.
	
	campoCantPersonas addMorph: title.
	body addMorph: campoCantPersonas.
]

{ #category : #adding }
AgregarExcursionOpcional >> addTablaExcursiones: unViaje [
	"Agrega una tabla con excursiones opcionales de un viaje"
	|label|.
	label := 'Seleccione una excursion' asMorph.
	tablaExcursiones := Table createColumns: (#(Descripcion 'Costo por persona') asOrderedCollection) extent: ((body width*0.5)@(body height*0.3)) dataSource: (DataSourceExcursionOpcional createCollection: (unViaje colExcursionesOpcionales) object: unViaje).
	
	tablaExcursiones top: masInfo top + 30; left: body left + 50.
	tablaExcursiones borderColor: Color black; borderWidth: 1.
	label bottom: tablaExcursiones top - 10; left: tablaExcursiones left.
	
	body addMorph: tablaExcursiones.
	tablaExcursiones addMorph: label.
	
	tablaExcursiones setClick: [ :obj |
		obj ifNotNil: [
			self borrarInputs.
			self addCampoCantPersonas.
			self addButtons.
		].	
	].
]

{ #category : #deleting }
AgregarExcursionOpcional >> borrarInputs [
	campoCantPersonas ifNotNil: [
			campoCantPersonas delete.
		].
	botonAgregarExcursion ifNotNil:[
			botonAgregarExcursion delete.	
		].
]

{ #category : #initialization }
AgregarExcursionOpcional >> initializeWithSystem: unSistema cliente: unCliente contrato: unContrato [
	super initializeWithSystem: unSistema cliente: unCliente contrato: unContrato.
	self addBotonBorrarVentana: 'Atras'.
	self addTitulo: 'Agregar excursiones opcionales'.
	self addTablaExcursiones: (contrato viaje).
]

{ #category : #updating }
AgregarExcursionOpcional >> update: o [
	super update: o.
	self borrarInputs.
]
